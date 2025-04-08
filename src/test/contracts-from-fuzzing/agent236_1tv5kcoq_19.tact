struct AlmostEmpty {
    x: Int;
}

contract OptionalAlmostEmptyStruct {
    s: AlmostEmpty?;

    init() {
        self.s = null;
    }
}