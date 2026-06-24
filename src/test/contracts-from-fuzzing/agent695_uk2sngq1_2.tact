struct MultiOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    s: String?;
}

contract OptionalFieldsTest {
    m: MultiOptional;

    init() {
        self.m = MultiOptional{
            a: null,
            b: true,
            c: null,
            s: "hello",
        };
    }
}