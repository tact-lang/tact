struct NestedOpt {
    f: Int?;
    b: Bool?;
    s: String?;
}

contract OptionFields {
    f1: NestedOpt;

    init() {
        self.f1 = NestedOpt{
            f: null,
            b: null,
            s: null,
        };
    }
}