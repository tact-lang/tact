struct Inner {
    s: String;
    sl: Slice;
}

contract SliceStringNested {
    store: Inner;

    init() {
        self.store = Inner{s: "abc", sl: emptyCell().asSlice()};
    }
}