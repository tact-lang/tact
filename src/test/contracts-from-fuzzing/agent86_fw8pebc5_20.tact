struct Base {
    x: Int;
    y: Bool;
}

struct Container {
    baseOpt: Base?;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            baseOpt: null,
        };
    }
}