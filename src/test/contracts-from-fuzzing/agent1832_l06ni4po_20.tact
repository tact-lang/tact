struct ReorderedOptional {
    f1: String?;
    f2: Int;
    f3: Bool?;
    f4: Int;
}

contract ContractReorderedOpt {
    data: ReorderedOptional;

    init() {
        self.data = ReorderedOptional{
            f1: null,
            f2: 8,
            f3: null,
            f4: 15
        };
    }
}
