struct DefaultsTest {
    foo: Int = 42;
    bar: Slice? = null;
    baz: String = "hello";
}

contract DefaultsStructStorage {
    data: DefaultsTest;

    init() {
        self.data = DefaultsTest{};
    }
}