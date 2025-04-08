message(101) Msg {
    foo: Int;
    extra: Slice as remaining;
}

contract TestContract {
    m: Msg?;

    init() {
        self.m = Msg{
            foo:1,
            extra: emptyCell().asSlice(),
        };
    }

    receive(){}
}