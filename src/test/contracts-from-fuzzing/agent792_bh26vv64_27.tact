struct Tiny {
    x: Int as uint4;
}

struct Container {
    t: Tiny;
    y: Int;
}

contract TestC {
    cont: Container;

    init() {
        self.cont = Container{ t: Tiny{ x: 2 }, y: 42 };
    }
}