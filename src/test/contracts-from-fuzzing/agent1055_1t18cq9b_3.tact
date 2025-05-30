struct ComplexStruct {
    n: Int;
    flag: Bool;
    who: Address;
    cellData: Cell;
    text: String;
}

contract NestedStructField {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            n: 7,
            flag: false,
            who: myAddress(),
            cellData: emptyCell(),
            text: "abc",
        };
    }
}