struct Inner {
    a: Int?;
    b: Bool?;
}

struct Container {
    nestedOpt: Inner?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            nestedOpt: null
        };
    }
}