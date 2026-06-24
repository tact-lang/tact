struct DeepOptional {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct OuterOpt {
    nested1: DeepOptional;
    nested2: DeepOptional?;
    flag: Bool;
}

contract OptionalStructsNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested1: DeepOptional{ a: 1, b: null, c: true },
            nested2: null,
            flag: false
        };
    }
}