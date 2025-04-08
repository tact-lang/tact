contract BigMix {
    i1: Int; i2: Int as uint32; i3: Int as int64;
    b1: Bool; b2: Bool;
    s1: String; s2: String;
    a1: Address; a2: Address;
    c1: Cell; c2: Cell;
    o1: Int?; o2: Bool?; o3: String?; o4: Address?; o5: Cell?;

    init() {
        self.i1=1; self.i2=2; self.i3=3;
        self.b1=true; self.b2=false;
        self.s1="hi"; self.s2="there";
        self.a1=myAddress(); self.a2=myAddress();
        self.c1=emptyCell(); self.c2=emptyCell();
        self.o1=null; self.o2=null; self.o3=null; self.o4=null; self.o5=null;
    }
}