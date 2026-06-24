// Contract with multiple deeply optional fields directly on contract
contract MultiOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: Cell?;
    e: Int?;
    f: Bool?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = null;
    }

    receive() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = 2;
        self.f = false;
    }
}