struct PartialDefaults {
    a: Int = 5;
    b: String = "test";
    c: Bool?;
}

contract OptionalPartialDefaults {
    s: PartialDefaults?;

    init() {
        self.s = null;
    }
}