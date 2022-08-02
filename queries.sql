select forms.estado, forms.qtde_lavagem_semana, forms.tipo_cabelo, forms.comprimento, forms.tipo_fios,
forms.procedimentos, forms.tempo_procedimento, forms.dieta, forms.atividade_fisica, forms.frequencia_estresse,
forms.faixa_etaria,forms.efeitos_desejados, forms.fragancia, orders.target
from forms
left join (
            with temptable1 as (
            select items.id_pedido, items.id_form, row_number() over (partition by items.id_form) as rn
            from order_items items
            )
            select temptable1.id_form, temptable1.id_pedido
            from temptable1
            where rn = 1
          ) items on forms.id_form = items.id_form
left join (
           select *
           from orders 
           ) orders on items.id_pedido = orders.id_pedido;