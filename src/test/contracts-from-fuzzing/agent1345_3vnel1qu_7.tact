struct DeepOptional {
    num: Int?;
    nested: Nested?;
}

struct Nested {
    value: String?;
    flag: Bool;
}

contract Test {
    info: DeepOptional;

    init() {
        self.info = DeepOptional{
            num: null,
            nested: Nested{
                value: null,
                flag: false
            }
        };
    }
}