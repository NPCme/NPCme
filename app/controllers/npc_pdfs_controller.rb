class NpcPdfsController < ApplicationController
  def show
    @npc = NpcModel.where(id: params[:id])[0]
    @split_spells_slots = @npc.spell_slots.split('{')[1].split('}')[0].split(',').map { |x| x[-1] } unless nil

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "NpcPdf No. #{@npc.id}",
               page_size: 'A4',
               template: 'npc_pdfs/show.html.erb',
               layout: 'pdf.html',
               orientation: 'Portrait',
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end
end
