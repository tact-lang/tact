struct OptionalStruct {
    nested: Nested?;
}

struct Nested {
    a: Bool?;
    b: Bool?;
}

contract OptInOptTest {
    data: OptionalStruct;

    init() {
        self.data = OptionalStruct{
            nested: Nested{
                a: null,
                b: true
            }
        };
    }
}
