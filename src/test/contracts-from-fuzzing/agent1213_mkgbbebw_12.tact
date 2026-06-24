struct Chain3 {
    a: Int;
    b: Int;
    c: Int;
}

struct Chain2 {
    d: Chain3;
    e: Chain3;
}

struct Chain1 {
    f: Chain2;
    g: Chain2;
}

contract ChainTest {
    all: Chain1;

    init() {
        let ch3 = Chain3{ a:1,b:2,c:3 };
        let ch2 = Chain2{ d:ch3, e:ch3 };
        self.all = Chain1{ f:ch2, g:ch2 };
    }
}