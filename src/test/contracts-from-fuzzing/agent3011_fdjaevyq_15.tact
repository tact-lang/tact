struct Defaulted {
    a: Int = 42;
    b: Bool = true;
    c: String = "ok";
}

contract DefaultsStructTest {
    foo: Defaulted;
    init() {
        self.foo = Defaulted{};
    }
}