struct DeepLevel3 {
    val3: Int;
}

struct DeepLevel2 {
    level3: DeepLevel3;
    str: String;
}

struct DeepLevel1 {
    level2: DeepLevel2;
    flag: Bool;
}

contract DeepNestedFields {
    f: DeepLevel1;

    init() {
        self.f = DeepLevel1{
            level2: DeepLevel2{
                level3: DeepLevel3{ val3: 99 },
                str: "deep"
            },
            flag: false
        };
    }
}