message(0xabc) InnerMsg {
    foo: Int;
}

struct Container {
    maybeMsg: InnerMsg?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{ maybeMsg: null };
    }
}