struct ManyTypes {
    flag: Bool;
    number: Int;
    txt: String;
    sliceField: Slice;
    cellField: Cell;
    addressField: Address;
    builderField: Builder;
}

contract ManyTypesContract {
    fields: ManyTypes;

    init() {
        self.fields = ManyTypes{
            flag: true,
            number: 123,
            txt: "hello",
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            addressField: myAddress(),
            builderField: beginCell(),
        };
    }
}