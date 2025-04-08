struct DeepOpt {
    i: Int?;
    s: String?;
}

struct OuterOpt {
    nested: DeepOpt?;
    flag: Bool;
}

contract Test {
    outer: OuterOpt;

    init() {
        self.outer = OuterOpt{
            nested: null,
            flag: false
        };
    }
}
