struct DefaultsandOpts {
    foo: Int = 1;
    bar: Bool?;
    baz: String = "abc";
}

contract DefaultsTest {
    s: DefaultsandOpts;

    init() {
        self.s = DefaultsandOpts{};
    }
}