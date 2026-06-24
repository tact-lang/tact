struct OptionalDeep {
    inner: InnerOpt;
}

struct InnerOpt {
    opt1: Int?;
    opt2: Bool?;
    opt3: String?;
    opt4: Address?;
}

contract NestedOptionalUsage {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            inner: InnerOpt{
                opt1: null,
                opt2: null,
                opt3: null,
                opt4: null
            }
        };
    }
}