struct BigNestedOptions {
    inner1: Int?;
    inner2: Bool?;
    inner3: Int?;
}

struct Container {
    nestedOpt: BigNestedOptions?;
    value: Int;
}

contract NestedOptionals {
    storage: Container;

    init() {
        self.storage = Container{
            nestedOpt: null,
            value: 10
        };
    }
}