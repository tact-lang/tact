struct A {
    x: Int;
}

struct B {
    y: Int;
}

struct Both {
    one: A;
    two: B;
}

contract Test {
    data: Both;

    init() {
        self.data = Both{
            one: A{ x:1 },
            two: B{ y:2 }
        };
    }
}