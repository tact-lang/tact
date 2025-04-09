struct ComplexStruct {
    intField: Int;
    boolField: Bool;
    cellField: Cell;
    addrField: Address;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optCell: Cell?;
    optAddr: Address?;
    optStr: String?;
}

contract ManyComplex {
    c1: ComplexStruct;
    c2: ComplexStruct;
    c3: ComplexStruct;
    c4: ComplexStruct;

    init() {
        let cs = ComplexStruct{
            intField: 0,
            boolField: false,
            cellField: emptyCell(),
            addrField: myAddress(),
            strField: "hi",
            optInt: null,
            optBool: null,
            optCell: null,
            optAddr: null,
            optStr: null
        };
        self.c1 = cs;
        self.c2 = cs;
        self.c3 = cs;
        self.c4 = cs;
    }
}