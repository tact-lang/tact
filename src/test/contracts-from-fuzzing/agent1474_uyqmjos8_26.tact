// large contract with many persistent variables directly
contract Test25 {
    a: Int; b: Bool; c: Int?; d: String; e: Slice; f: Cell; g: Address; h: Bool?;
    i: Int; j: Int; k: Int; l: Int; m: Int; n: Int; o: Int; p: Int; q: Int;
    
    init() {
        self.a=1; self.b=true; self.c=null; self.d="hi"; self.e=emptyCell().asSlice(); self.f=emptyCell(); self.g=myAddress(); self.h=false;
        self.i=1; self.j=2; self.k=3; self.l=4; self.m=5; self.n=6; self.o=7; self.p=8; self.q=9;
    }
}