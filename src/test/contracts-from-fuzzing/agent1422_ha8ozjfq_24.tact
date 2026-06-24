struct DeepOptional {
    inner: Int?;
}

struct FurtherDeep {
    nested: DeepOptional?;
}

contract NullInNull {
    stuff: FurtherDeep;

    init() {
        self.stuff = FurtherDeep{
            nested: null,
        };
    }
}