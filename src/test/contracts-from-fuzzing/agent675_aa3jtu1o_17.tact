contract VeryLongFields {
    a:Int=1; b:Int=2; c:Int=3; d:Int=4; e:Int=5; f:Int=6; g:Int=7; h:Int=8; i:Int=9; j:Int=10;
    k:Int=11; l:Int=12; m:Int=13; n:Int=14; o:Int=15; p:Int=16; q:Int=17; r:Int=18; s:Int=19; t:Int=20;
    u:Int=21; v:Int=22; w:Int=23; x:Int=24; y:Int=25; z:Int=26; aa:Int=27; ab:Int=28; ac:Int=29; ad:Int=30;
    ae:Int=31; af:Int=32; ag:Int=33; ah:Int=34; ai:Int=35; aj:Int=36; ak:Int=37; al:Int=38; am:Int=39; an:Int=40;

    receive() {
        let _ = self.al;
    }
}