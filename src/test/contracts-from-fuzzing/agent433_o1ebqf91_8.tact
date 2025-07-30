contract ManyFields {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; g: Cell; h: Cell?; i: Slice; j: Slice?; k: Address; l: Address?;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "ok";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = emptyCell();
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = null;
        self.k = myAddress();
        self.l = null;
    }
}