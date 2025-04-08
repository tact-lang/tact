contract ManyOptionals {
    a: Int?;
    b: String?;
    c: Address?;
    d: Cell?;
    e: Bool?;

    init() {
        self.a = null;
        self.b = "hello";
        self.c = null;
        self.d = emptyCell();
        self.e = true;
    }
}
