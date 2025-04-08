contract BigMixed {
    i1:Int;
    b1:Bool;
    s1:String;
    a1:Address;
    sl1:Slice;
    c1:Cell;
    i2:Int?;
    b2:Bool?;
    s2:String?;
    a2:Address?;
    sl2:Slice?;
    c2:Cell?;

    init() {
        self.i1=1;self.b1=true;self.s1="x";self.a1=myAddress();self.sl1=emptyCell().asSlice();self.c1=emptyCell();
        self.i2=null;self.b2=null;self.s2=null;self.a2=null;self.sl2=null;self.c2=null;
    }
}