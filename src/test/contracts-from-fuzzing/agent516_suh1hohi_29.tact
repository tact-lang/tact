struct DeepOptionalStruct {
    deep: Int?;
}

struct OuterOptional {
    optional: DeepOptionalStruct?;
}

contract DoubleLayerNullable {
    state: OuterOptional?;

    init() {
        self.state = null;
    }
}
