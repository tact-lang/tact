contract LargeFlatContract {
    a:Int; b:Bool; c:Address; d:Cell; e:Slice; f:String;
    g:Int; h:Bool; i:Address; j:Cell; k:Slice; l:String;

    init() {
        self.a=0; self.b=false; self.c=myAddress(); self.d=emptyCell(); self.e=emptyCell().asSlice(); self.f="";
        self.g=0; self.h=false; self.i=myAddress(); self.j=emptyCell(); self.k=emptyCell().asSlice(); self.l="";
    }
}