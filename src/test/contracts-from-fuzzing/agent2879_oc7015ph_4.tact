struct A {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
}

contract Test {
    big: A;

    init() {
        self.big = A{
            a: 0,
            b: false,
            c: "hi",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice()
        };
    }
}