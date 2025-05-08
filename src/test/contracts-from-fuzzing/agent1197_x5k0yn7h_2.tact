struct DeepA {
    b: DeepB;
}

struct DeepB {
    c: DeepC;
}

struct DeepC {
    d: DeepD?;
}

struct DeepD {
    val: Int;
    flag: Bool;
}

contract TestContract {
    state: DeepA;
    
    init() {
        self.state = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{ val: 10, flag: true }
                }
            }
        };
    }
}