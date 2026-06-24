struct Combined {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    c: Combined;

    init() {
        self.c = Combined{
            a: 42,
            b: true,
            c: "Text",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }

    receive() {
        self.c = self.c;
    }
}
