struct MixOpt {
    s: String?;
    b: Bool?;
    a: Address?;
}

struct WithMixOpt {
    id: Int;
    nested: MixOpt;
}

contract Test {
    f: WithMixOpt;

    init() {
        self.f = WithMixOpt{
            id: 1,
            nested: MixOpt{
                s: null,
                b: false,
                a: null
            }
        };
    }
    receive() {}
}