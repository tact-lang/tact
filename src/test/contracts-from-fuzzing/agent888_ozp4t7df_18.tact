struct TwoLevelsOptional {
    s: String?;
    flag: Bool?;
}

struct OuterOptional {
    nested: TwoLevelsOptional?;
}

contract ContractWithOuterOptional {
    storage: OuterOptional;
    init() {
        self.storage = OuterOptional{
            nested: null,
        };
    }
}