struct InnerA { x: Int; }

struct InnerB { y: Int; }

struct Composition {
    first: InnerA;
    second: InnerB;
}

contract MultipleStructs {
    data: Composition;

    init() {
        self.data = Composition{
            first: InnerA{x:1},
            second: InnerB{y:2}
        };
    }
}
