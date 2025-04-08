struct One {
    x: Int;
}
struct Two {
    y: Int;
}
struct Both {
    a: One;
    b: Two;
}

contract Test {
    value: Both;
    init() {
        self.value = Both{
            a: One{ x: 10 },
            b: Two{ y: 20 }
        };
    }
}