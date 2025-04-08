contract TestLongFields {
    a: Int; b: Bool; c: Address; d: Slice; e: Cell; f: String; g: Int?; h: Bool?; i: Address?; j: Slice?; k: Cell?; l: String?; m: Int; n: Bool; o: Address; p: Slice; q: Cell; r: String;

    init() {
        self.a=0; self.b=true; self.c=myAddress(); self.d=emptyCell().asSlice(); self.e=emptyCell(); self.f="";
        self.g=null; self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
        self.m=1; self.n=false; self.o=myAddress(); self.p=emptyCell().asSlice(); self.q=emptyCell(); self.r="text";
    }
}