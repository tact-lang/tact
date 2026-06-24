struct OptionNest {
    innerOpt: Bool?;
}

struct OuterOpt {
    nested: OptionNest?;
}

contract OptDeep {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{ nested: null };
    }
}