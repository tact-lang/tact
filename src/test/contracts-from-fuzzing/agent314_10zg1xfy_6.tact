struct DeeplyNestedOptional {
    part1: InnerStruct?;
    part2: Bool;
}

struct InnerStruct {
    value: Int;
    label: String;
}

contract OptionalDeepNestedStorage {
    nestedOpt: DeeplyNestedOptional?;
    init() {
        self.nestedOpt = null;
    }
}