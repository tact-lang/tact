struct HasSlice {
    sl: Slice;
    s: String;
}

contract ContainsSliceStruct {
    f: HasSlice;

    init() {
        self.f = HasSlice{sl: "abc".asSlice(), s: "abc"};
    }
}