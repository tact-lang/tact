struct Chain3 {
    a: Int;
    b: Chain2;
}

struct Chain2 {
    c: Int;
    d: Chain1;
}

struct Chain1 {
    e: Int;
    f: Bool;
}

contract NestedChain {
    all: Chain3;

    init() {
        self.all = Chain3{
            a:1,
            b: Chain2{
                c:2,
                d: Chain1{
                    e:3,
                    f:true
                }
            }
        };
    }
}