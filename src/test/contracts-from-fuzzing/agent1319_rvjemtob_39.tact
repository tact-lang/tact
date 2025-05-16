struct InnerD {
    a: Int = 42;
    b: Bool = false;
}

contract StructWithDefaultsTest {
    foo: InnerD;

    init() {
        self.foo = InnerD{};
    }
}