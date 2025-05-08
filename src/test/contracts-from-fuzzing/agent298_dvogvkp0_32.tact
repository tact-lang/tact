struct Chain2 {
    a: Int;
}

struct Chain1 {
    b: Chain2;
}

contract ChainOfTwo {
    c: Chain1;
    init() {
        self.c = Chain1 { b: Chain2 { a: 5 } };
    }
}