message(101) Msg {
    foo: Int;
    extra: Slice as remaining;
}

contract TestContract {
    m: Msg?;

    init() {
        self.m = null;
    }

    receive(){}
}