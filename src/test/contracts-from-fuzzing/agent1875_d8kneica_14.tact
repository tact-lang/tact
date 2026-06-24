struct InnerOpt {
    i: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract FuzzOptDefaults {
    s: OuterOpt;

    init() {
        self.s = OuterOpt {
            nested: InnerOpt {
                i: 42
            }
        };
    }
}
