struct ManySlices {
    s1: Slice;
    s2: Slice;
    s3: Slice;
    s4: Slice;
    s5: Slice;
}

contract TestContract {
    data: ManySlices;

    init() {
        let sl = emptyCell().asSlice();
        self.data = ManySlices{ s1:sl,s2:sl,s3:sl,s4:sl,s5:sl };
    }
}