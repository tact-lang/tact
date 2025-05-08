struct DeeplyNested {
    level1: Bool;
    level2: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    optionalInt: Int?;
}

contract TestContract {
    value: DeeplyNested;

    init() {
        self.value = DeeplyNested{
            level1: true,
            level2: InnerStruct{flag: false, optionalInt: null}
        };
    }
}