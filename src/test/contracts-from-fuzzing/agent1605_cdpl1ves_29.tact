struct OptionalOfOptional {
    nested: InnerOpt?;
}

struct InnerOpt {
    value: Int?;
}

contract OptionalOptTest {
    data: OptionalOfOptional;

    init() {
        self.data = OptionalOfOptional{
            nested: null
        };
    }
}