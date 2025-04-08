struct AAA {
    a: Int;
}

struct BBB {
    b1: Int;
    b2: AAA;
}

struct CCC {
    c1: Int;
    c2: BBB;
}

contract DeepNest {
    deep: CCC;

    init() {
        self.deep = CCC{
            c1:1,
            c2: BBB{
                b1:2,
                b2: AAA{a:3}
            }
        };
    }
}