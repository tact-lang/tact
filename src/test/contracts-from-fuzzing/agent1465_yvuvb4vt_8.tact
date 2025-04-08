struct OptionalChain {
    optInt: Int?;
    optBool: Bool?;
}

struct Container {
    oc: OptionalChain?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{oc: null};
    }
}
