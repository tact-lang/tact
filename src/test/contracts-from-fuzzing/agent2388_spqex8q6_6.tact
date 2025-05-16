struct SimpleA {
    x: Int;
}

struct SimpleB {
    y: Bool;
}

struct Outer {
    a: SimpleA;
    b: SimpleB;
}

contract MultipleNestings {
    field: Outer;

    init() {
        self.field = Outer{
            a: SimpleA{x: 42},
            b: SimpleB{y: true}
        };
    }
}