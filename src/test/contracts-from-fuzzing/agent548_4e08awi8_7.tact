struct Inner {
    flag: Bool;
}

struct WithDefaults {
    num: Int = 123;
    str: String = "hello";
    opt: Int?; // default null
    nested: Inner = Inner{ flag: true };
}

contract DefaultsTest {
    d: WithDefaults;

    init() {
        self.d = WithDefaults{};
    }
}
