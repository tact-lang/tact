contract LongList {
    a: Int; b: Bool; c: String; d: Int as uint8; e: Int as int64;
    f: Int?; g: String?; h: Bool?; i: Int; j: Bool;
    k: String; l: Int?; m: Bool?; n: String?; o: Int;

    init() {
        self.a=1; self.b=true; self.c="x"; self.d=2; self.e=3;
        self.f=4; self.g=null; self.h=false; self.i=5; self.j=true;
        self.k="y"; self.l=null; self.m=true; self.n=null; self.o=6;
    }
}