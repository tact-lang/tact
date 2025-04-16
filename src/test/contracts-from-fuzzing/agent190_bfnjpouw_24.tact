message(0x3) Msg {
    val: Int;
}

struct Container {
    content: Msg?;
}

contract TestContract {
    rec: Container;

    init() {
        self.rec = Container{
            content: null
        };
    }
}