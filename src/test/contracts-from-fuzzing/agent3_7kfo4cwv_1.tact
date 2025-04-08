struct Nested {
    x: Int;
    y: Int?;
}

contract TestContract {
    a: Int?;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Nested;
    h: Nested?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = Nested{ x: 1, y: null };
        self.h = null;
    }
    
    receive() {}
}