struct DeepA {
    b: DeepB;
}

struct DeepB {
    c: DeepC;
}

struct DeepC {
    d: DeepD;
}

struct DeepD {
    e: DeepE;
}

struct DeepE {
    val: Int;
}

contract DeepChain {
    deeep: DeepA;

    init() {
        self.deeep = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{
                        e: DeepE{ val: 999 },
                    },
                },
            },
        };
    }
}