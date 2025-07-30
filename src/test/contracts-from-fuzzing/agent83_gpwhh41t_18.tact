struct InnerA {
    a: Int;
}

struct InnerB {
    b: Int;
}

struct Container {
    partA: InnerA;
    partB: InnerB;
}

contract SeparateNested {
    store: Container;
    init() {
        self.store = Container{
            partA: InnerA{ a:1 },
            partB: InnerB{ b:2 }
        };
    }
}
