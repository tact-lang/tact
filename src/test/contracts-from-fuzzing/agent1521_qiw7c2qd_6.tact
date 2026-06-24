struct MixTypes {
    num: Int;
    flag: Bool;
    txt: String;
    cellVal: Cell;
    addressVal: Address;
    sliceVal: Slice;
    builderVal: Builder;
}

contract MixedStorage {
    st: MixTypes;

    init() {
        self.st = MixTypes{
            num:123,
            flag:true,
            txt:"abc",
            cellVal: emptyCell(),
            addressVal: myAddress(),
            sliceVal: emptyCell().asSlice(),
            builderVal: beginCell(),
        };
    }
}