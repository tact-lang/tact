struct SOpt {
    a: Int?;
    b: Bool?;
}

struct SNestedOpt {
    s: SOpt?;
}

contract NestedOptFields {
    f: SNestedOpt;

    init() {
        self.f = SNestedOpt{
            s: SOpt{
                a: null,
                b: null,
            },
        };
    }
}