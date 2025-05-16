contract ManyOptionals {
    a: Bool?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}