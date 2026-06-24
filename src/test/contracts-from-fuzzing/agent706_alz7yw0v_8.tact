struct WithManyFields {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;
    c1: Cell;
    c2: Cell;
}

contract TestContract {
    bigField: WithManyFields;

    init() {
        self.bigField = WithManyFields{
            i1: 1,
            i2: 2,
            b1: true,
            b2: false,
            s1: "one",
            s2: "two",
            a1: myAddress(),
            a2: myAddress(),
            c1: emptyCell(),
            c2: emptyCell(),
        };
    }
}