struct S {
    a: Int;
    b: String;
    c: Address;
    d: Cell;
    e: Slice;
    f: Bool;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 42,
            b: "hi",
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: true,
        };
    }
}