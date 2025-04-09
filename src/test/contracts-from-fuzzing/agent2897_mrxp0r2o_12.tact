struct InnerA { x: Int }
struct InnerB { y: Int }

struct Container {
    first: InnerA;
    second: InnerB;
}

contract MultiNestedDifferentStructs {
    pair: Container;
    init() {
        self.pair = Container{first: InnerA{x: 10}, second: InnerB{y: 20}};
    }
}