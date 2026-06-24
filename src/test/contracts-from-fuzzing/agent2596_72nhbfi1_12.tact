struct Prims2 {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: Slice;
    t: String;
}

contract InitPrims {
    f: Prims2;

    init() {
        self.f = Prims2{
            i: 5,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            t: "hello",
        };
    }
}