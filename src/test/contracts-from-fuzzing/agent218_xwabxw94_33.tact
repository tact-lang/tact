struct SubA {
    one: Int?;
    two: Bool? = false;
}

struct SubB {
    three: String?;
    four: Address?;
}

struct BigNest {
    sa: SubA;
    sb: SubB;
}

contract DualNestedOpts {
    data: BigNest;

    init() {
        self.data = BigNest{
            sa: SubA{},
            sb: SubB{ three: null, four: null }
        };
    }
}