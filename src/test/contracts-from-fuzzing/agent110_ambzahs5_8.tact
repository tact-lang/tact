contract ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "test";
    }

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
        let _ = self.e;
        let _ = self.f;
    }
}