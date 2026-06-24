struct MultipleDefaults {
    one: Int = 1;
    two: Int = 2;
    three: Int = 3;
}

contract Test38 {
    val: MultipleDefaults;

    init() {
        self.val = MultipleDefaults{};
    }
}
