struct Mid {
    a: Int;
    b: String;
}

contract TestContract {
    x: Int = 1;
    y: Bool = true;
    z: String = "a";
    s: Slice;
    c: Cell;
    addr: Address;
    nested: Mid;

    init() {
        self.x = 1;
        self.y = true;
        self.z = "a";
        self.s = emptyCell().asSlice();
        self.c = emptyCell();
        self.addr = myAddress();
        self.nested = Mid{a: 10, b: "hi"};
    }

    receive() {}
}