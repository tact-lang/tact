struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    data: MultiOptional;

    init() {
        self.data = MultiOptional{
            a: null,
            b: true,
            c: null
        };
    }
}