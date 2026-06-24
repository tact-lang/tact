struct OptNested {
    nested: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: Bool;
}

contract OptionalLayers {
    store: OptNested;

    init() {
        self.store = OptNested{
            nested: InnerOpt{
                a: 17,
                b: false,
            }
        };
    }
}
