struct ContainsSlice {
    s: Slice;
    optSlice: Slice?;
}

contract SliceHolder {
    f: ContainsSlice;

    init() {
        self.f = ContainsSlice{
            s: emptyCell().asSlice(),
            optSlice: null
        };
    }
}