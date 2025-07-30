struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Bool?;
    g: Int?;
    h: String;
    i: Address;
    j: Bool;
}

contract ContractManyFields {
    sf: ManyFields;

    init() {
        self.sf = ManyFields{
            a: 10,
            b: true,
            c: "str",
            d: emptyCell(),
            e: myAddress(),
            f: null,
            g: null,
            h: "abc",
            i: myAddress(),
            j: false
        };
    }
}