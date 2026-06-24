struct S1 { x: Int; }
struct S2 { y: Int; }

struct Container {
    s1: S1;
    optS2: S2?;
}

contract NestedOptionals {
    data: Container;

    init() {
        self.data = Container{
            s1: S1{ x: 1 },
            optS2: null,
        };
    }
}