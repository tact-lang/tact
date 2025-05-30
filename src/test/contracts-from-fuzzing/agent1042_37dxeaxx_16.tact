struct HasSlice {
    s: Slice;
}

struct UsesSlice {
    nested: HasSlice;
}

contract SliceFieldNest {
    f: UsesSlice;
    init() {
        self.f = UsesSlice{
            nested: HasSlice{ s: emptyCell().asSlice() }
        };
    }
}