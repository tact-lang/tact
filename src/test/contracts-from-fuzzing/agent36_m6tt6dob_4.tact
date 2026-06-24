struct OptionalNest {
    inner: Int?;
}

contract OptStructField {
    s: OptionalNest;
    init() {
        self.s = OptionalNest{ inner: null };
    }
}