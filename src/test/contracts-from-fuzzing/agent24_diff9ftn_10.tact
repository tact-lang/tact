struct Sub {
    val: Int;
}

struct Wrap {
    inside: Sub;
}

struct Container {
    wrap1: Wrap;
    wrap2: Wrap;
}

contract NestedDefaults {
    c: Container;

    init() {
        self.c = Container{
            wrap1: Wrap{ inside: Sub{ val: 5 } },
            wrap2: Wrap{ inside: Sub{ val: 10 } }
        };
    }
}