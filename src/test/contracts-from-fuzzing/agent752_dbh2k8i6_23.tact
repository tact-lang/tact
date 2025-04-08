struct TestNestedDefaults {
    a: Int = 12;
    b: Bool = true;
}

struct Wrapper {
    inner: TestNestedDefaults = TestNestedDefaults{};
    opt: Int? = null;
}

contract NestedDefaults {
    complex: Wrapper;

    init() {
        self.complex = Wrapper{};
    }
}