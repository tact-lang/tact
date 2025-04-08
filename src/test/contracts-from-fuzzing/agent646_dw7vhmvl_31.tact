struct DefaultOptionalFields {
    foo: Int? = null;
    bar: Bool? = null;
}

contract DefaultOptionalsTest {
    data: DefaultOptionalFields;

    init() {
        self.data = DefaultOptionalFields{};
    }
}