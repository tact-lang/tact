contract OptionalSlice {
    s: Slice?;

    init() {
        self.s = null;
    }

    receive() {
        let _ = self.s;
    }
}