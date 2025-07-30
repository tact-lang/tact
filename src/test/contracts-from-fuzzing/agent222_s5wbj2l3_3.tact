struct OptionalStruct {
    a: Int;
    b: Int?;
    c: AnotherStruct?;
}

struct AnotherStruct {
    x: Int;
    y: Bool;
}

contract OptionalFieldsTest {
    field: OptionalStruct;

    init() {
        self.field = OptionalStruct{
            a: 1,
            b: null,
            c: null
        };
    }
}