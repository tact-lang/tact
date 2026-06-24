struct NestedOpt {
    optInt: Int?;
    optBool: Bool?;
}

struct Container {
    id: Int;
    nestedOpt: NestedOpt?;
}

contract Test7 {
    cont: Container;

    init() {
        self.cont = Container{
            id: 42,
            nestedOpt: null
        };
    }
}