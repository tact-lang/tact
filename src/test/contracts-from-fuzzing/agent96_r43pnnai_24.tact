struct Str {
    f: String;
}

struct SliceInner {
    s: Slice;
}

contract StringSlicePersistence {
    strct: Str;
    sstruct: SliceInner;

    init() {
        self.strct = Str{ f: "foo" };
        self.sstruct = SliceInner{ s: emptyCell().asSlice() };
    }
}