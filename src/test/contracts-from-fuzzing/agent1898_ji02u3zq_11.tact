contract ManyFields {
    a: Int; b: Bool; c: String; d: Address; e: Cell; f: Slice; g: Builder; h: Int?; i: Bool?; j: Address?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
    }
}