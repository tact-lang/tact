struct S1 {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
}

contract TestAllTypes {
    s1: S1;
    optionalS1: S1?;

    init() {
        self.s1 = S1{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: myAddress(),
        };

        self.optionalS1 = null;
    }
}
