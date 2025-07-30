struct SliceStruct {
    sl: Slice;
    text: String;
}

contract SlicePersist {
    s: SliceStruct;

    init() {
        self.s = SliceStruct{
            sl: emptyCell().asSlice(),
            text: "slice",
        };
    }
}