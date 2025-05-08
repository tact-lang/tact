struct ManyTypes {
    flag: Bool;
    count: Int;
    message: String;
    dataCell: Cell;
    sliceData: Slice;
    addressVal: Address;
}

contract MultiTypeStorage {
    store: ManyTypes;

    init() {
        self.store = ManyTypes{
            flag: true,
            count: 42,
            message: "test",
            dataCell: emptyCell(),
            sliceData: emptyCell().asSlice(),
            addressVal: myAddress(),
        };
    }
}