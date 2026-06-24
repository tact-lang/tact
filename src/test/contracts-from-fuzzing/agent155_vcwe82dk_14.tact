struct DeepWithOptionals {
    level3: Int?;
    str3: String?;
}

struct MidWithOptionals {
    deep: DeepWithOptionals;
    flag: Bool?;
}

contract TestContract {
    mid: MidWithOptionals = MidWithOptionals{
        deep: DeepWithOptionals{},
        flag: null
    };

    init() {
        self.mid = MidWithOptionals{
            deep: DeepWithOptionals{},
            flag: null
        };
    }
}