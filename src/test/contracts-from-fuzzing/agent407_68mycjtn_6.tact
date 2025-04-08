struct DefaultValTest {
    foo: Int = 7;
    bar: String = "hello";
    baz: Bool = true;
    opt: Int?;
}

contract DefaultValStorage {
    data: DefaultValTest;
    init() {
        self.data = DefaultValTest{};
    }
}
