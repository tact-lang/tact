message InnerMsg { a: Int; }

struct Container {
    num: Int;
    msg: InnerMsg;
}

contract TestContract {
    payload: Container;

    init() {
        self.payload = Container{
            num: 1,
            msg: InnerMsg{ a: 2 }
        };
    }
}