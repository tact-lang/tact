struct InnerOpt {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct OuterOpt {
    a: InnerOpt?;
    b: Int?;
}

contract NestedOptionals {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            a: null,
            b: null,
        };
    }
}
