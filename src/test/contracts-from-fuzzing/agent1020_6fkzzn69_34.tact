struct DeepStructA {
    a: DeepStructB;
}
struct DeepStructB {
    b: DeepStructC;
}
struct DeepStructC {
    c: DeepStructD;
}
struct DeepStructD {
    d: Int;
}
contract DeepContract {
    nested: DeepStructA;
    init() {
        self.nested = DeepStructA{
            a: DeepStructB{
                b: DeepStructC{
                    c: DeepStructD{
                        d: 42
                    }
                }
            }
        };
    }
}
