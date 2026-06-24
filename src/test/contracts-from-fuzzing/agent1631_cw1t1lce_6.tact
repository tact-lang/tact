struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: OptionalNested?;
}

struct OptionalNested {
    s: String?;
    flag: Bool?;
}

contract TestDeepOptional {
    deepOpt: DeepOptional;

    init() {
        self.deepOpt = DeepOptional{
            x: null,
            y: null,
            z: OptionalNested{
                s: null,
                flag: null,
            },
        };
    }
}