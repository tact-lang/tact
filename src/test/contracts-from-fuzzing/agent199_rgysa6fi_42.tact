struct Small { x: Int; }

struct Container {
    a: Small;
    b: Small;
    c: Small;
    d: Small;
    e: Small;
}

contract Containers {
    fields: Container;

    init() {
        self.fields = Container{
            a: Small{x:1},
            b: Small{x:2},
            c: Small{x:3},
            d: Small{x:4},
            e: Small{x:5},
        };
    }
}
