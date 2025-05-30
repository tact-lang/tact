struct Tiny {
    a: Int;
}

struct Container {
    f1: Tiny;
    f2: Tiny;
    f3: Tiny;
    f4: Tiny;
    f5: Tiny;
}

contract StructArrayEmul {
    arr: Container;

    init() {
        self.arr = Container{
            f1: Tiny{ a: 1 },
            f2: Tiny{ a: 2 },
            f3: Tiny{ a: 3 },
            f4: Tiny{ a: 4 },
            f5: Tiny{ a: 5 },
        };
    }
}