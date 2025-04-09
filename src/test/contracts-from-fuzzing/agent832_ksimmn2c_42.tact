struct HasSlice {
    sl: Slice;
    s: String;
}

contract SliceStorage {
    data: HasSlice;

    init() {
        self.data = HasSlice{
            sl: emptyCell().asSlice(),
            s: "done",
        };
    }
}