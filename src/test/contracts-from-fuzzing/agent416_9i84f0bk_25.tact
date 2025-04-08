struct OptSlice {
    s: Slice?;
}

contract TestOptSlice {
    val: OptSlice;

    init() {
        self.val = OptSlice{ s: null };
    }
}