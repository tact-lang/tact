struct OptNest {
    nested: Int?;
    nestedStr: String?;
}

struct Container {
    opt1: OptNest?;
    opt2: OptNest?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            opt1: OptNest{nested: 1, nestedStr: null},
            opt2: null
        };
    }
}