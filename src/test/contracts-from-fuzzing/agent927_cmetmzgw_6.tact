struct OptionalNested {
    a: Int?;
    b: Sub?;
}

struct Sub {
    s: String;
    flag: Bool;
}

contract OptionalFieldsTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            a: null,
            b: null
        };
    }
}