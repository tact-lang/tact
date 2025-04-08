struct InnerOpt {
    a: String?;
    b: Int;
}

struct Container {
    x: InnerOpt?;
    y: Bool;
}

contract NestedOpts {
    s: Container;

    init() {
        self.s = Container{
            x: InnerOpt{a: null, b: 5},
            y: true
        };
    }
}
