struct DeepOpt {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

struct OuterDeepOpt {
    nested: DeepOpt?;
}

contract NestedOptionalContract {
    data: OuterDeepOpt;

    init() {
        self.data = OuterDeepOpt{
            nested: null
        };
    }
}