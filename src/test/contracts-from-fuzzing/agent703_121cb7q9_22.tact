message(17) InnerMsg {
    n: Int;
}

struct Wrapper {
    msg: InnerMsg;
    done: Bool;
}

contract TestContract {
    data: Wrapper;
    init() {
        self.data = Wrapper{
            msg: InnerMsg{ n: 5 },
            done: false
        };
    }
}