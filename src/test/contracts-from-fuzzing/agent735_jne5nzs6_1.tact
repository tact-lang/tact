struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Cell;
    f: Slice;
    g: String;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: myAddress(),
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: "test",
        };
    }
}
