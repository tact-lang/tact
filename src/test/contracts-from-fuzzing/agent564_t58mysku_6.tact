// Test contract with many persistent fields of mixed types
contract WideContract {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Int?;
    g: Bool?;
    h: String;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = null;
        self.g = null;
        self.h = "world";
        self.i = 42;
        self.j = false;
    }

    receive() {
        self.i += 1;
    }
}