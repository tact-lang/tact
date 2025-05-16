struct WithString {
    s: String;
    sOpt: String?;
}

struct WithSlice {
    sl: Slice;
    slOpt: Slice?;
}

contract MixedStructs {
    strings: WithString;
    slices: WithSlice;

    init() {
        self.strings = WithString{ s: "xyz", sOpt: null };
        self.slices = WithSlice{ sl: emptyCell().asSlice(), slOpt: null };
    }
}