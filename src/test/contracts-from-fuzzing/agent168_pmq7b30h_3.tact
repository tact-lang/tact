struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsTest {
    data: S;

    init() {
        self.data = S{
            a: null,
            b: true,
            c: null,
        };
    }
}
