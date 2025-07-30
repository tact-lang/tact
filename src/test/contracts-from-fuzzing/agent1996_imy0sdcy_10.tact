struct InnerA { x: Int; }
struct InnerB { y: Int; }
struct Container {
    iA: InnerA;
    iB: InnerB;
}

contract PersistenceMultipleStructs {
    bundle: Container;

    init() {
        self.bundle = Container{
            iA: InnerA{ x: 123 },
            iB: InnerB{ y: 456 },
        };
    }
}