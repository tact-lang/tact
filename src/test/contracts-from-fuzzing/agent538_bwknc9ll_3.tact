struct DeepOptional {
    value: Int?;
}

struct LayerTwo {
    deepOpt: DeepOptional?;
}

contract OptDeep {
    nestedOpt: LayerTwo;

    init() {
        self.nestedOpt = LayerTwo{
            deepOpt: null
        };
    }
}
