struct HasDefaults {
    foo: Int = 21;
    bar: Bool = true;
    msg: String = "ok";
}

contract DefaultsInStructTest {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
}
