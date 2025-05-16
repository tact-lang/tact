struct InnerOpt {
    sub: Int?;
}

struct Mid {
    node: InnerOpt;
}

contract OptionalLayered {
    state: Mid;

    init() {
        self.state = Mid{ node: InnerOpt{ sub: null } };
    }
}