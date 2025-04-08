struct StructA {
    foo: Int;
}

struct StructB {
    bar: Int;
}

struct Container {
    a: StructA;
    b: StructB;
}

contract NestedDifferentStructs {
    c: Container;

    init() {
        self.c = Container{
            a: StructA{foo: 1},
            b: StructB{bar: 2}
        };
    }
}