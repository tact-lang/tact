struct Defaulted {
    foo: Int = 3;
    bar: Bool = false;
    baz: String = "hello";
}

contract DefaultedFieldStructTest {
    data: Defaulted;
    init() {
        self.data = Defaulted{};
    }
}
