struct MixedNestedDefaults {
    foo: Int = 1;
    bar: Bool? = null;
    name: String = "test";
    flag: Bool = false;
    addr: Address? = null;
    num: Int? = null;
    text: String = "abc";
}

contract ComplexDefaults {
    data: MixedNestedDefaults;

    init() {
        self.data = MixedNestedDefaults{};
    }
}