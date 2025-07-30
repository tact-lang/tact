struct OptionalLayer {
    innerOpt: Int?;
    strOpt: String?;
}

struct Container {
    a: Int;
    optLayer: OptionalLayer;
}

contract NestedOptionals {
    c: Container;

    init() {
        self.c = Container{
            a: 42,
            optLayer: OptionalLayer{
                innerOpt: null,
                strOpt: null,
            },
        };
    }
}