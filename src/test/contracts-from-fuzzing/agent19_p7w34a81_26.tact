struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct NestedAB {
    a: A;
    b: B;
}

contract SeparateNestedAB {
    nestedAB: NestedAB;

    init() {
        self.nestedAB = NestedAB{
            a: A{ x: 10 },
            b: B{ y: 20 },
        };
    }
}