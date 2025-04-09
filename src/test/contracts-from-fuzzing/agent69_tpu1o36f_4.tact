struct SOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    s: SOptional;

    init() {
        self.s = SOptional{
            a: null,
            b: null,
            c: null
        };
    }
}