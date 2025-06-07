contract PrimitiveTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;

    init() {
        self.a = 123;
        self.b = false;
        self.c = "hello";
        self.d = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
    }
}