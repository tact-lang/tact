struct MixTypes {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
}

contract TestContract {
    mt: MixTypes;

    init() {
        self.mt = MixTypes{
            intVal: 1,
            boolVal: true,
            strVal: "mix",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addrVal: myAddress(),
        };
    }
}