struct DefaultedOptional {
    foo: Int? = null;
}

contract DefaultedOptionalTest {
    data: DefaultedOptional;

    init() {
        self.data = DefaultedOptional{};
    }
}