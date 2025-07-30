struct SubA { a: Int; }
struct SubB { b: Int; }
struct Container {
    sA: SubA;
    sB: SubB;
}

contract MultipleStructs {
    data: Container;

    init() {
        self.data = Container{
            sA: SubA{a:1},
            sB: SubB{b:2},
        };
    }
}