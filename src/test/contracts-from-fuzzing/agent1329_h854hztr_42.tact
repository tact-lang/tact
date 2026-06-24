struct OptSlice {
    opt: Slice?;
}

contract TestOptSlice {
    v: OptSlice;

    init() {
        self.v = OptSlice{ opt: null };
    }
}
