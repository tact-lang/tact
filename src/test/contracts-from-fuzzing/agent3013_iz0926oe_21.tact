struct OuterOpt {
    s: String?;
    b: Bool?;
}

struct WithOuter {
    outer: OuterOpt?;
}

contract NullableContainer {
    f: WithOuter;

    init() {
        self.f = WithOuter{ outer: null };
    }
}
