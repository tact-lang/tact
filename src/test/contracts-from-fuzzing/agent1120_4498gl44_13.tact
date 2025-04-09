struct RecA {
    b: RecB;
}

struct RecB {
    x: Int;
}

contract Recurse {
    data: RecA;
    init() {
        self.data = RecA{b: RecB{x: 5}};
    }
}