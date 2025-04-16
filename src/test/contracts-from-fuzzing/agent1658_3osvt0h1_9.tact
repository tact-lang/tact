struct InnerA { x: Int; }
struct InnerB { y: Int; }

struct Container {
    a: InnerA;
    b: InnerB;
}

contract MultiNestedDifferent {
    cont: Container;

    init() {
        self.cont = Container{
            a: InnerA{ x: 1 },
            b: InnerB{ y: 2 }
        };
    }
}