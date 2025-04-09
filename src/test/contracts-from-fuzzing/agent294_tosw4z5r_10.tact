message(3) Pong {
    y: Int;
}

struct Container {
    msg: Pong?;
}

contract NestedOptMsg {
    cont: Container;

    init() {
        self.cont = Container{ msg: null };
    }
}
