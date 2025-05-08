struct NestedWithDefaults {
    a: Int = 7;
    b: Bool?;
}

contract Cont {
    n: NestedWithDefaults;

    init() {
        self.n = NestedWithDefaults{};
    }
}