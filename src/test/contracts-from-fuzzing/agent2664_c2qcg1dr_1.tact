struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract Test {
    data: S;

    init() {
        self.data = S{
            a: 42,
            b: true,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}