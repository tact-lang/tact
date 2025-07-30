struct DeepA {
    a: Int;
}
struct DeepB {
    b: DeepA;
}
struct DeepC {
    c: DeepB;
}

contract DeepChain {
    data: DeepC;

    init() {
        self.data = DeepC{
            c: DeepB{
                b: DeepA{
                    a: 42,
                },
            },
        };
    }
}