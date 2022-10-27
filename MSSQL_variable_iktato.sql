Declare 
 @Brutto real
 

Select 
@Brutto = (select sum(BRUTTO) from IKTATO_KT where IKTATO_KT.IKTSZAM='K/179542')

Select @Brutto