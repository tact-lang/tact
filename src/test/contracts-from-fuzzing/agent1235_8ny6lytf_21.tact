struct InnerDefaults {
    a: Int = 123;
    b: String = "abc";
}

contract DefaultsNested {
    val: InnerDefaults;

    init() {
        self.val = InnerDefaults{ a: 456, b: "def" };
    }
}