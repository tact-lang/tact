struct WithDefaults {
    foo: Int = 5;
    bar: String = "abc";
    baz: Bool = false;
    opt1: Int? = null;
    opt2: String? = null;
}

contract Defaulted {
    val: WithDefaults;

    init() {
        self.val = WithDefaults{};
    }
}
