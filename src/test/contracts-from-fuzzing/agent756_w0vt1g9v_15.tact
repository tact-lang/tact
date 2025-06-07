struct BigOption {
    nested: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract ComplexOptionals {
    data: BigOption;
    init() {
        self.data = BigOption{
            nested: null,
        };
    }
}