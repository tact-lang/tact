struct HasDefaults {
    foo: Int = 42;
    bar: Bool = false;
    txt: String = "abc";
}

contract DefaultsContract {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}