struct OptionalAtEveryLevel {
    s: String?;
}

struct ContainsOpt1 {
    nested: OptionalAtEveryLevel;
    i: Int?;
}

struct ContainsOpt2 {
    nested: ContainsOpt1;
    b: Bool?;
}

contract MultiLevelOptionals {
    s2: ContainsOpt2;

    init() {
        self.s2 = ContainsOpt2{
            nested: ContainsOpt1{
                nested: OptionalAtEveryLevel{
                    s: null
                },
                i: null
            },
            b: null
        };
    }
}