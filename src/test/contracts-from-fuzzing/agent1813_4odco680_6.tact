contract LargeFlat {
    a: Int; b: Bool; c: String; d: Slice; e: Int; f: Bool; g: String; h: Slice;
    i: Int; j: Bool; k: String; l: Slice; m: Int; n: Bool; o: String; p: Slice;
    q: Int; r: Bool; s: String; t: Slice;

    init() {
        self.a=1; self.b=true; self.c="x"; self.d=emptyCell().asSlice();
        self.e=2; self.f=false; self.g="y"; self.h=emptyCell().asSlice();
        self.i=3; self.j=true; self.k="z"; self.l=emptyCell().asSlice();
        self.m=4; self.n=false; self.o="w"; self.p=emptyCell().asSlice();
        self.q=5; self.r=true; self.s="v"; self.t=emptyCell().asSlice();
    }
}