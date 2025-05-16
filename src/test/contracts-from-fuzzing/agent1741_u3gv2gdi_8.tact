contract TestContract {
    a: Int; b: Bool; c: Int?; d: Bool?; e: Cell; f: Slice; g: Address; h: String;
    i: Cell?; j: Slice?; k: Address?; l: String?;

    init() {
        self.a = 1; self.b = false; self.c = null; self.d = null;
        self.e = emptyCell(); self.f = emptyCell().asSlice();
        self.g = myAddress(); self.h = "hi";
        self.i = null; self.j = null; self.k = null; self.l = null;
    }
}