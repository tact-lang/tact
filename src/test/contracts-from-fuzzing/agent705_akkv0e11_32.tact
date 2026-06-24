contract LargeSerialMixed {
    a:Int as int8;
    b:Int as uint8;
    c:Int as uint32;
    d:Int as int64;
    e:Int as uint128;
    f:Int as int256;
    g:String;
    h:Bool;
    i:Address;
    j:Cell;
    k:Slice;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4; self.e=5; self.f=6;
        self.g="text"; self.h=true; self.i=myAddress(); self.j=emptyCell(); self.k=self.j.asSlice();
    }
}