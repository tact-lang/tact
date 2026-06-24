struct Chain {
    a: Int;
    next: Chain2;
}

struct Chain2 {
    b: Int;
    next: Chain3;
}

struct Chain3 {
    c: Int;
}

contract ChainTest {
    root: Chain;

    init() {
        self.root = Chain{
            a:1,
            next: Chain2{
                b:2,
                next: Chain3{c:3}
            }
        };
    }
}
