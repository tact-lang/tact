struct DefaultStruct {
    foo: Int = 10;
    bar: Bool = false;
}

contract DefaultsTest {
    value: DefaultStruct;

    init() {
        self.value = DefaultStruct{};
    }
}