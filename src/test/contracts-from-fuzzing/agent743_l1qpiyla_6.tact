struct OptionalNest {
    innerOpt: Int?;
    boolFlag: Bool;
}

struct OuterOpt {
    nested: OptionalNest?;
    text: String?;
}

contract OptPersist {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            nested: OptionalNest{ innerOpt:null, boolFlag: true },
            text: null
        };
    }
}