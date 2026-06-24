struct A {
    x: Int?;
}

struct B {
    a: A?;
    y: Int?;
}

contract NestedOptMix {
    state: B;

    init() {
        self.state = B{
            a: null,
            y: null
        };
    }
}