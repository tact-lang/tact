struct OptionalsEverywhere {
    a: Int?;
    b: Bool?;
    nest: NestedOpt?;
}

struct NestedOpt {
    c: String?;
    d: Address?;
}

contract DeeplyNullable {
    s: OptionalsEverywhere;

    init() {
        self.s = OptionalsEverywhere{
            a: null,
            b: null,
            nest: null
        };
    }
}