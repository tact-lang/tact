struct MixedTypes {
    count: Int;
    name: String;
    flag: Bool;
    dataCell: Cell;
    addressValue: Address;
    builderValue: Builder;
    sliceValue: Slice;
}

contract MixedStorage {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            count: 42,
            name: "example",
            flag: true,
            dataCell: emptyCell(),
            addressValue: myAddress(),
            builderValue: beginCell(),
            sliceValue: emptyCell().asSlice()
        };
    }
}