struct MixTypes {
    anInt: Int;
    aBool: Bool;
    anOpt: Int?;
    aStr: String;
    aCell: Cell;
    aSlice: Slice;
    anAddr: Address;
}

contract MixedPersistent {
    store: MixTypes;

    init() {
        self.store = MixTypes{
            anInt: 7,
            aBool: true,
            anOpt: null,
            aStr: "hello",
            aCell: emptyCell(),
            aSlice: emptyCell().asSlice(),
            anAddr: myAddress(),
        };
    }
}