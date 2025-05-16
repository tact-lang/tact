struct HasDefaults {
    foo: Int = 5;
    bar: Bool = true;
    baz: String = "abc";
}

contract DefaultsInPersistent {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}