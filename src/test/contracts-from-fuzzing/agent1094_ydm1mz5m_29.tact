struct RecA {
    x: Int;
}

struct RecB {
    a: RecA;
    y: Int;
}

contract CrossNested {
    foo: RecB;
    init() {
        self.foo = RecB{a: RecA{x:1}, y:2};
    }
}