message(0xabcdef01) Msg {}

struct Container {
    item: Msg?;
}

contract TestOptMsgContainer {
    data: Container;
    init() {
        self.data = Container{ item: Msg{} };
    }
}