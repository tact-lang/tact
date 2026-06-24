struct HasDefault {
    foo: Int = 10;
    bar: Bool = true;
    baz: String = "hi";
}

contract TestDefaults {
    val: HasDefault;
    init() {
        self.val = HasDefault{};
    }
}