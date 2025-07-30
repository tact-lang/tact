struct TestOptional {
    a: Int;
    b: Bool?;
    s: String?;
}

contract OptionalFields {
    data: TestOptional;

    init() {
        self.data = TestOptional{
            a: 100,
            b: null,
            s: null
        };
    }
}