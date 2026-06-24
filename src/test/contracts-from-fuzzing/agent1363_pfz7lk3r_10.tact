struct TupleStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
}

contract StructFieldContract {
    tup: TupleStruct;

    init() {
        self.tup = TupleStruct{
            a: 99,
            b: true,
            c: myAddress(),
            d: emptyCell(),
        };
    }
}