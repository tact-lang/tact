contract MixedFields {
    x: Int = 1;
    y: String = "str";
    z: Bool = true;
    a: Slice;
    b: Cell;
    c: Address;
    d: Int;
    e: String;
    f: Bool;

    init() {
        self.a = emptyCell().asSlice();
        self.b = emptyCell();
        self.c = myAddress();
        self.d = 42;
        self.e = "hello";
        self.f = false;
    }
}