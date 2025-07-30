struct NestedStringSlice {
    s: String;
    sl: Slice;
}

contract NestedStringSliceField {
    f: NestedStringSlice;

    init() {
        self.f = NestedStringSlice{ s: "abc", sl: emptyCell().asSlice() };
    }
}