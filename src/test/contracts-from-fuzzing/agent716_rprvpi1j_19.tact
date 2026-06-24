contract SliceOptionalPersistent {
    s1: Slice? = null;
    s2: Slice?;

    init() {
        self.s2 = null;
    }
}