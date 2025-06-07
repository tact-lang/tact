struct MultipleDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "foo";
}

contract Test {
    val: MultipleDefaults = MultipleDefaults{};

    init() {
        self.val = MultipleDefaults{};
    }
}