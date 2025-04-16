struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addressVal: Address;
}

contract MixedStorage {
    mix: MixTypes;

    init() {
        self.mix = MixTypes{
            intVal: 1,
            boolVal: true,
            stringVal: "test",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addressVal: myAddress()
        };
    }
}
