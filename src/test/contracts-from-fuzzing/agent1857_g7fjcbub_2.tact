struct MultiOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptHeavy {
    field: MultiOpt;

    init() {
        self.field = MultiOpt{
            f1: null,
            f2: true,
            f3: null
        };
    }
}