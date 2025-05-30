contract OptionalNums {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Slice?;
    s: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = null;
        self.d = emptyCell();
        self.e = null;
        self.s = "x";
    }

    receive(){}
}