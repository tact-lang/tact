message MyMsg {
    foo: Int;
}

contract TestContract {
    m: MyMsg = MyMsg{foo: 7};

    init() {}

    receive() {
        dump(self.m.foo);
    }
}