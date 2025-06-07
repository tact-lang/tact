struct HasSliceStr {
    s: Slice;
    t: String;
}

contract SliceString {
    f: HasSliceStr;

    init() {
        self.f = HasSliceStr{
            s: emptyCell().asSlice(),
            t: "abc"
        };
    }
}