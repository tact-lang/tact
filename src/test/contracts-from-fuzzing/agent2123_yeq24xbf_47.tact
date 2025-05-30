contract OptionalSliceString {
    s: Slice?;
    t: String?;

    init() {
        self.s = null;
        self.t = null;
    }
}