struct ManyTypes {
    flag: Bool;
    number: Int as uint32;
    text: String;
    someCell: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addr: Address;
}

contract TypeMix {
    storage: ManyTypes;

    init() {
        self.storage = ManyTypes{
            flag: true,
            number: 42,
            text: "test",
            someCell: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
            addr: myAddress(),
        };
    }
}
