struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct HasOptionalNest {
    nest: OptionalNest?;
}

contract NestedNulls {
    state: HasOptionalNest;

    init() {
        self.state = HasOptionalNest{
            nest: null
        };
    }
}