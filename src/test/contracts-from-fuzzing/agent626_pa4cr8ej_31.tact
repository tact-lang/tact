struct NestedPartialDefaults {
    a: Int = 0;
    b: Int;
}

contract PartialDefaults {
    s: NestedPartialDefaults;

    init() {
        self.s = NestedPartialDefaults{ b: 42 };
    }
}