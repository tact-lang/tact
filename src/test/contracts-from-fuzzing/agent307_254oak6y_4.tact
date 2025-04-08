struct S {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
}

contract TestContract {
    data: S;
    init() {
        self.data = S{
            a: 10,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "test"
        };
    }
}