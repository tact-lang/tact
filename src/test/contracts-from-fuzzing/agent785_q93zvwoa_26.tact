struct In1 {
    x: Int;
}

struct In2 {
    y: Int;
}

struct Container {
    a: In1?;
    b: In2?;
}

contract MultiOpt {
    c: Container;

    init() {
        self.c = Container{
            a: null,
            b: null,
        };
    }
}