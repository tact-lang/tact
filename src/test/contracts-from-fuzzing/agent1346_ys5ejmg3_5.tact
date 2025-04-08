struct Chain3 {
    n: Int;
}

struct Chain2 {
    next: Chain3;
}

struct Chain1 {
    next: Chain2;
}

contract ChainTest {
    c: Chain1 = Chain1 { next: Chain2 { next: Chain3 { n: 5 } } };
    val: Int = 0;

    init() {
        self.val = self.c.next.next.n;
    }
}
