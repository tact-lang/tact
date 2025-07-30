contract ManyFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "x";
    // d: Address
    // e: Cell
    // f: Slice

    init() {
        self.a = 2;
        self.b = false;
        self.c = "y";
    }
}