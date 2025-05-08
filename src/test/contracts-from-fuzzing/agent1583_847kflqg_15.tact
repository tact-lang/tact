struct DeepOpt {
    maybe1: Int?;
    maybe2: String?;
    maybe3: Bool?;
}

struct ContainsDeepOpt {
    nested: DeepOpt?;
    flag: Bool;
}

contract OptInOptStruct {
    data: ContainsDeepOpt;

    init() {
        self.data = ContainsDeepOpt{
            nested: null,
            flag: true,
        };
    }
}