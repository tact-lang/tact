contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: Cell?;
    d: String;

    init() {
        self.a = null;
        self.b = true;
        self.c = emptyCell();
        self.d = "test";
    }
}
