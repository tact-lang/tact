contract LargePrimitives {
    x1:Int;
    x2:Int;
    x3:Int;
    x4:Int;
    x5:Int;
    b1:Bool;
    b2:Bool;
    b3:Bool;
    s1:String;
    s2:String;
    s3:String;
    c1:Cell;
    c2:Cell;
    c3:Cell;
    sl1:Slice;
    sl2:Slice;
    sl3:Slice;
    bl1:Builder;
    bl2:Builder;
    bl3:Builder;

    init() {
        self.x1=1; self.x2=2; self.x3=3; self.x4=4; self.x5=5;
        self.b1=true; self.b2=false; self.b3=true;
        self.s1="a"; self.s2="b"; self.s3="c";
        self.c1=emptyCell(); self.c2=emptyCell(); self.c3=emptyCell();
        self.sl1=emptyCell().asSlice(); self.sl2=emptyCell().asSlice(); self.sl3=emptyCell().asSlice();
        self.bl1=beginCell(); self.bl2=beginCell(); self.bl3=beginCell();
    }
}