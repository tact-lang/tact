struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract DefaultValuesTest {
    foo: Defaults;

    init() {
        self.foo = Defaults{};
    }
}