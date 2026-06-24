message(1) Msg {
    foo: Int;
}

struct Box {
    bar: Int;
    msg: Msg?;
}

contract Test {
    bx: Box;

    init() {
        self.bx = Box{
            bar: 77,
            msg: null,
        };
    }

    receive() {}
}