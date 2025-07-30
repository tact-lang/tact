struct DeepOptional {
    x: Int?;
    y: String?;
    z: Bool?;
}

struct OuterOpt {
    nested: DeepOptional;
}

contract OptContract {
    state: OuterOpt = OuterOpt{
        nested: DeepOptional{
            x: null,
            y: null,
            z: null,
        }
    };
}