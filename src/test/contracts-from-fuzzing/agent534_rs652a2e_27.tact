struct Chain {
    a: Int;
    b: Chain2;
}

struct Chain2 {
    x: Int;
    y: Chain3;
}

struct Chain3 {
    z: Int;
}

contract ChainTest {
    data: Chain;

    init() {
        self.data = Chain{
            a:1,
            b: Chain2{
                x:2,
                y: Chain3{z:3}
            }
        };
    }
}