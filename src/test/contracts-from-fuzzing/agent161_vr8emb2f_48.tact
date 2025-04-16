// contract with both persistent optionals and optionals inside nested struct

struct InnerOptMix {
    f1: Int?;
    f2: String?;
    f3: Bool?;
}

contract OuterMixOpt {
    opt1: Int?;
    opt2: String?;
    nested: InnerOptMix?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.nested = null;
    }
}
