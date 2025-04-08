contract MixedOptionsDefaulted {
    a: Int? = null;
    b: Bool = true;
    c: Address? = null;
    d: Cell;
    e: String = "hello";

    init() {
        self.a = 10;
        self.b = false;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "world";
    }
}