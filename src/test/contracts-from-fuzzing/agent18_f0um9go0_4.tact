struct DeepA {
    v: Int;
}
struct DeepB {
    d: DeepA;
}
struct DeepC {
    d: DeepB;
}
struct DeepD {
    d: DeepC;
}
contract DeepNest {
    val: DeepD;
    init() {
        self.val = DeepD{
            d: DeepC{
                d: DeepB{
                    d: DeepA{ v: 42 },
                }
            }
        };
    }
}
