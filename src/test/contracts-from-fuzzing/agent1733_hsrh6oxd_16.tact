contract Lengthy {
    a: Int; b: Bool; c: Address; d: Cell; e: Slice; f: String;
    g: Int?; h: Bool?; i: String?; j: Address; k: Cell;
    l: Slice; m: String; n: Int; o: Bool; p: Int?;
    q: Bool?; r: String?; s: Address; t: Cell;

    init() {
        self.a = 1; self.b = true; self.c = myAddress(); self.d = emptyCell();
        self.e = emptyCell().asSlice(); self.f = "hi"; self.g = null;
        self.h = null; self.i = null; self.j = myAddress(); self.k = emptyCell();
        self.l = emptyCell().asSlice(); self.m = "hello"; self.n = 2;
        self.o = false; self.p = null; self.q = null; self.r = null;
        self.s = myAddress(); self.t = emptyCell();
    }
}