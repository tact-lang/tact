struct DeepOptional {
    nested: Int?;
    sub: SubStruct?;
}

struct SubStruct {
    x: Int;
}

contract DeepOpt {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: null,
            sub: SubStruct{ x: 1 }
        };
    }
}