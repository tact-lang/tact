contract MixOfTypes {
    a: Int;
    b: Bool?;
    c: Address;
    d: String?;
    e: Cell;
    f: Cell?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = myAddress();
        self.d = null;
        self.e = emptyCell();
        self.f = null;
    }
}