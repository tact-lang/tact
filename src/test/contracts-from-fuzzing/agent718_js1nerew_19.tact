struct Outer {
    f1: Int;
    nested: NestedA;
}

struct NestedA {
    g1: Int;
    nested2: NestedB;
}

struct NestedB {
    h1: Int;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            f1: 1,
            nested: NestedA{
                g1: 2,
                nested2: NestedB{
                    h1: 3
                }
            }
        };
    }
}