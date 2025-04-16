struct Prims {
    i: Int;
    b: Bool;
    a: Address;
    c: Cell;
    s: String;
}

contract AllPrims {
    p: Prims;

    init() {
        self.p = Prims{
            i: 7,
            b: true,
            a: myAddress(),
            c: emptyCell(),
            s: "hello",
        };
    }
}