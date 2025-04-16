struct DeeplyNestedOptional {
    str: String?;
    addr: Address?;
}

struct MiddleLayer {
    nested: DeeplyNestedOptional?;
    flag: Bool;
}

contract NestedOptionalsInStruct {
    value: MiddleLayer;

    init() {
        self.value = MiddleLayer{
            nested: null,
            flag: true
        };
    }
}
