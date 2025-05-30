message(111) InnerMsg {
    foo: Int?;
}

struct Container {
    maybeMsg: InnerMsg?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            maybeMsg: InnerMsg{ foo: 123 }
        };
    }
}