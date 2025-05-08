// very long contract with many fields of mixed types and nested struct
struct L1 { f: Int; g: Bool; h: String; }
struct L2 { j: Int?; k: Bool?; l: String?; m: Address; n: Slice?; o: Cell; }

contract HugeMix {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice;
    g: Int?; h: Bool?; i: String?; j: Address?; k: Cell?; l: Slice?;
    s1: L1;
    s2: L2;

    init() {
        self.a=1; self.b=true; self.c="x"; self.d=myAddress();
        self.e=emptyCell(); self.f=emptyCell().asSlice();
        self.g=null; self.h=null; self.i=null; self.j=null; self.k=null; self.l=null;
        self.s1 = L1{ f:2, g:false, h:"y" };
        self.s2 = L2{ j:null, k:null, l:null, m:myAddress(), n:null, o:emptyCell() };
    }
}