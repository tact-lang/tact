struct EmbedSlice {
    content: Slice;
    note: String;
}

contract SliceInStruct {
    data: EmbedSlice;

    init() {
        self.data = EmbedSlice{ content: emptyCell().asSlice(), note: "testnote" };
    }
}