// non-optional fields without explicit initialization (should require init to assign)
contract MustInitFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "txt";
        self.d = emptyCell();
        self.e = self.d.asSlice();
        self.f = myAddress();
    }
}