contract OptionalUninit {
    a: Int?;
    b: Bool?;

    init() {
        self.a = null;
        // b remains uninitialized (should be null implicitly)
    }
}