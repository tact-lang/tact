struct MultiSlice {
    a: Slice;
    b: Slice?;
    c: Slice;
    d: Slice?;
}

contract SliceNesting {
    data: MultiSlice;

    init() {
        let s = emptyCell().asSlice();
        self.data = MultiSlice{ a:s, b:null, c:s, d:s };
    }
}