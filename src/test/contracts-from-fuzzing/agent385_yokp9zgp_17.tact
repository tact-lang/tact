struct NestedDefaults {
    val: Int = 42;
    opt: Int?;
}

contract DefaultInNested {
    inner: NestedDefaults;

    init() {
        self.inner = NestedDefaults{};
    }
}