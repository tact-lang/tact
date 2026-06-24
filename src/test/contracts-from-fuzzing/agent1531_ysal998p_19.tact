struct One {
    a: Int;
}

struct Two {
    b: Int;
}

contract Test {
    x: One;
    y: Two;

    init() {
        self.x = One{a:1};
        self.y = Two{b:2};
    }
}
