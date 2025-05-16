struct Child {
    x: Int?;
}

struct Container {
    c1: Child?;
    c2: Child?;
}

contract OptOptContainer {
    f: Container;

    init() {
        self.f = Container{
            c1: null,
            c2: null,
        };
    }
}
