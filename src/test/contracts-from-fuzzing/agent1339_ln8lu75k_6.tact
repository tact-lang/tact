struct DeepOptional {
    x: Int?;
    y: String?;
}

struct NestedOptional {
    deep: DeepOptional?;
    z: Int;
}

contract DeepOptionalsStruct {
    bigOpt: NestedOptional;

    init() {
        self.bigOpt = NestedOptional{
            deep: null,
            z: 42
        };
    }
}