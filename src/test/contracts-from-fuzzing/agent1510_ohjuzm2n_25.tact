message(1) InnerMsg {
    foo: Int;
}

message(2) OuterMsg {
    bar: InnerMsg? = null;
}

struct Wrap {
    m: OuterMsg;
}

contract TestContract {
    data: Wrap = Wrap{m: OuterMsg{bar: null}};

    init() {
        self.data = Wrap{m: OuterMsg{bar: null}};
    }

    receive() {
        let _ = self.data;
    }
}