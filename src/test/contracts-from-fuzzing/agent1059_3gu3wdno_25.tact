struct SDefault {
    a: Int = 5;
    b: String = "hello";
}

contract NestedDefaults {
    s: SDefault;
    init() {
        self.s = SDefault{};
    }
}