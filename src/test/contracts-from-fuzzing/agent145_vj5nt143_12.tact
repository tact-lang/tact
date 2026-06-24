struct MultipleTypes {
    integer: Int;
    boolean: Bool;
    string: String;
    cellVal: Cell;
    sliceVal: Slice;
    addressVal: Address;
}

contract VarietyContract {
    data: MultipleTypes;

    init() {
        self.data = MultipleTypes{
            integer: 100,
            boolean: true,
            string: "Test",
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            addressVal: myAddress(),
        };
    }
}
