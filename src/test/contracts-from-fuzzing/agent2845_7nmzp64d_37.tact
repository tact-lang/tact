contract MixMany {
    a:Int; b:Bool; c:String; d:Slice; e:Cell;
    f:Int?; g:Bool?; h:String?; i:Slice?; j:Cell?;

    init() {
        self.a=1; self.b=true; self.c="a"; self.d=emptyCell().asSlice(); self.e=emptyCell();
        self.f=null; self.g=null; self.h=null; self.i=null; self.j=null;
    }
}