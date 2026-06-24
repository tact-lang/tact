message(10) InnerMsg {
    code: Int;
}

struct Wrapper {
    msg: InnerMsg;
    desc: String;
}

struct Container {
    w: Wrapper?;
    flag: Bool;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{
            w: null,
            flag: true
        };
    }
}