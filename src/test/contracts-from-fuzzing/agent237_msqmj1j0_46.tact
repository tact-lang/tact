struct DeepStringOpt {
    s: String?;
}

struct DeepLevel2 {
    nested: DeepStringOpt?;
}

struct DeepLevel3 {
    nested2: DeepLevel2?;
}

contract DeepNullableChain {
    data: DeepLevel3;
    init() {
        self.data = DeepLevel3{nested2: null};
    }
}