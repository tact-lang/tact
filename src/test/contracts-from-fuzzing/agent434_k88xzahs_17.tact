struct SliceStruct {
    s: Slice;
    opt: Slice?;
}

contract TestContract {
    d: SliceStruct;

    init() {
        self.d = SliceStruct{
            s: emptyCell().asSlice(),
            opt: null
        };
    }
}