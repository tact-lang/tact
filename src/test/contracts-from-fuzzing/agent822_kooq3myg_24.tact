message MyMsg {
    x: Int;
}

struct Container {
    m: MyMsg?;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            m: null
        };
    }
}
