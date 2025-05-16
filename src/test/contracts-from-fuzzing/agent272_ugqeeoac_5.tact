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
    val: Int;
}

contract DeepPersist {
    deep: DeepA;
    init() {
        self.deep = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{ val: 42 }
                }
            }
        };
    }
}