struct DeepOptional {
    a: Int?;
    b: Bool?;
    nested: Nested?;
}

struct Nested {
    x: Int?;
    y: String?;
}

contract DeepOptTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            a: null,
            b: null,
            nested: Nested{
                x: null,
                y: null
            }
        };
    }
}