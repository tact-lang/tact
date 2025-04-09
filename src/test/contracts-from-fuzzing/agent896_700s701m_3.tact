struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract Test {
    data: S1;
    init() {
        self.data = S1{
            a: 7,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}