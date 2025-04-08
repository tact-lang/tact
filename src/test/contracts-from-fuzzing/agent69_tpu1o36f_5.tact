struct DeepOptional {
    level2: InnerOptional?;
}

struct InnerOptional {
    text: String?;
}

contract OptionalNest {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            level2: InnerOptional{
                text: null
            }
        };
    }
}