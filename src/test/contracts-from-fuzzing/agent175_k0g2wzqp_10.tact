contract LargeFlat {
    a: Int; b: Bool; c: String; d: Address; e: Cell;
    f: Slice; g: Int?; h: Bool?; i: String?; j: Address?; k: Cell?;
    l: Slice?; m: Int; n: Bool; o: String; p: Address; q: Cell;
    r: Slice; s: Int?; t: Bool?; u: String?; v: Address?; w: Cell?; x: Slice?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = 2;
        self.h = false;
        self.i = "i";
        self.j = null;
        self.k = null;
        self.l = null;
        self.m = 3;
        self.n = false;
        self.o = "o";
        self.p = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
        self.s = null;
        self.t = null;
        self.u = null;
        self.v = null;
        self.w = null;
        self.x = null;
    }
}