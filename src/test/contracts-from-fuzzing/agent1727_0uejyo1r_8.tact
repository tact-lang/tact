struct Small {
    f1: Int;
    f2: Bool;
}

struct Container {
    inner1: Small;
    inner2: Small;
    inner3: Small;
    inner4: Small;
}

contract MultiNested {
    wrapped: Container;

    init() {
        self.wrapped = Container{
            inner1: Small{ f1: 1, f2: true },
            inner2: Small{ f1: 2, f2: false },
            inner3: Small{ f1: 3, f2: true },
            inner4: Small{ f1: 4, f2: false },
        };
    }
}
