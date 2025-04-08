struct DataTypes {
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract MixedTypes {
    store: DataTypes;

    init() {
        self.store = DataTypes { 
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "Hello"
        };
    }
}