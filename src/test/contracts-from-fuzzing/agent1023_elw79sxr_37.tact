struct HasSlice {
    s: Slice;
}

struct HasOptionalSlice {
    opt: Slice?;
}

contract TestSlices {
    h1: HasSlice;
    h2: HasOptionalSlice;

    init() {
        self.h1 = HasSlice{ s: emptyCell().asSlice() };
        self.h2 = HasOptionalSlice{ opt: null };
    }
}