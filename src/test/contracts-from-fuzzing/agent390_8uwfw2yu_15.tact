struct AAA {
    a: Int;
    b: BBB;
}

struct BBB {
    x: CCC;
}

struct CCC {
    y: DDD;
}

struct DDD {
    z: Int;
}

contract DeepNest4 {
    root: AAA;

    init() {
        self.root = AAA{
            a:42,
            b: BBB{
                x: CCC{
                    y: DDD{
                        z: 100
                    }
                }
            }
        };
    }
}
