select *
from foksz
order by case when G_A_SZAMLA like '1%' then '9'
			  when G_A_SZAMLA like '2%' then '8'
			  when G_A_SZAMLA like '3%' then '7'
			  when G_A_SZAMLA like '4%' then '6'
			  when G_A_SZAMLA like '5%' then '5'
			  when G_A_SZAMLA like '6%' then '4'
			  when G_A_SZAMLA like '7%' then '3'
			  when G_A_SZAMLA like '8%' then '2'
			  when G_A_SZAMLA like '9%' then '1'
			  else '0'
	     end,
		 G_A_SZAMLA

