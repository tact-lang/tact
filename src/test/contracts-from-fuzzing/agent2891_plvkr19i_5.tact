struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalFieldsTest {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            a: null,
            b: null,
            c: true
        };
    }
}