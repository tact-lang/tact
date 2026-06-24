struct OptSlice {
    s1: Slice?;
}

contract SliceOptional {
    so: OptSlice;

    init() {
        self.so = OptSlice{ s1: null };
    }
}
