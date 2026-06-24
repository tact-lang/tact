struct OptionalNested {
    inner: Bool?;
    message: String?;
}

contract OptionalComplex {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ inner: null, message: null };
    }
}
