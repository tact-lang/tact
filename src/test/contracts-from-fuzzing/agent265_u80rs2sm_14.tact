struct TupleStruct {
    num: Int;
    txt: String;
    flag: Bool;
    addr: Address;
    cellData: Cell;
}

contract TupleStore {
    tuple: TupleStruct;

    init() {
        self.tuple = TupleStruct{
            num: 555,
            txt: "tuple",
            flag: true,
            addr: myAddress(),
            cellData: emptyCell()
        };
    }

    receive() {
        self.tuple = self.tuple;
    }
}