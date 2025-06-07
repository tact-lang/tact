struct DeepWithDefaults {
    level: Int;
    sub: SubStruct;
}

struct SubStruct {
    val: Int = 42;
    optStr: String?;
}

contract DefaultsDeep {
    data: DeepWithDefaults;

    init() {
        self.data = DeepWithDefaults{
            level: 10,
            sub: SubStruct{ optStr: null }
        };
    }
}