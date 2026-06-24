struct A {
    x: Int;
    y: Int;
}

struct B {
    a1: A;
    a2: A;
}

contract ManyNestedSameType {
    pair: B;

    init() {
        self.pair = B{
            a1: A{x:1, y:2},
            a2: A{x:3, y:4}
        };
    }
}