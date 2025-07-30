struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
}

contract TestContract {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;

    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;

    deepStruct: Deep;

    init() {
        self.intVal = 1;
        self.boolVal = true;
        self.strVal = "hello";
        self.addrVal = myAddress();
        self.cellVal = emptyCell();

        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;

        self.deepStruct = Deep{
            a: 2,
            b: false,
            c: "world",
            d: myAddress(),
            e: emptyCell(),
        };
    }
}
