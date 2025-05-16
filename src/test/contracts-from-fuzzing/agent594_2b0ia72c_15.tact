struct AllPrimitives {
    n: Int;
    f: Bool;
    addr: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract Test15 {
    all: AllPrimitives;

    init() {
        self.all = AllPrimitives{
            n: 123,
            f: true,
            addr: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "testing",
        };
    }

    receive() {}
}