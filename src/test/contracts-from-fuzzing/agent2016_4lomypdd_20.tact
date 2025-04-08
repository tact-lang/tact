struct DeepA {
    a: Int;
    b: DeepB;
}

struct DeepB {
    c: Int;
    d: DeepC;
}

struct DeepC {
    e: Int;
    f: DeepD;
}

struct DeepD {
    g: Int;
    h: Bool;
}

contract Test {
    val: DeepA;
    init() {
        self.val = DeepA{
            a: 1,
            b: DeepB{
                c: 2,
                d: DeepC{
                    e:3,
                    f: DeepD{
                        g:4,
                        h:true
                    }
                }
            }
        };
    }
}