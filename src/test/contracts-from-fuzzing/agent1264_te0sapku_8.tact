struct Container {
    number: Int;
    flag: Bool;
    cellValue: Cell;
    sliceValue: Slice;
    stringVal: String;
    addressVal: Address;
}

contract PrimitivesContract {
    storage: Container;

    init() {
        self.storage = Container{
            number: 123,
            flag: true,
            cellValue: emptyCell(),
            sliceValue: emptyCell().asSlice(),
            stringVal: "test",
            addressVal: myAddress()
        };
    }
}
