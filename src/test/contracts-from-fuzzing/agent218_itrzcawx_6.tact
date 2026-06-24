struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract AllPrimitiveTypes {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}