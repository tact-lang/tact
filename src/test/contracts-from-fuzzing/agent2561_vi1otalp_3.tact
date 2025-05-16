struct S {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract LargeTuple {
    s: S;
    init() {
        self.s = S{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hello",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}