struct WrapOpt {
    innerOpt: Int?;
}

struct Container {
    w: WrapOpt?;
}

contract NestedOptionalContainer {
    data: Container;

    init() {
        self.data = Container{
            w: null
        };
    }
}