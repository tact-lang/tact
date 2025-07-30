// Contract with mix of primitive persistent fields
contract PrimitivesMix {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 123;
        self.b = true;
        self.c = "some";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
    }
}