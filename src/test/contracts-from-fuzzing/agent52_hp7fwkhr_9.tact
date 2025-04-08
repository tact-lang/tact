struct DeepOptional {
    nested: NestedOpt?;
}

struct NestedOpt {
    x: Bool;
    y: String?;
}

contract DeepOptionalTest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: NestedOpt{
                x: false,
                y: null
            }
        };
    }
}
