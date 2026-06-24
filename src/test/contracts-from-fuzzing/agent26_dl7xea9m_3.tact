struct DeepA {
    x: Int;
}

struct DeepB {
    a: DeepA;
    y: Bool;
}

struct DeepC {
    b: DeepB;
    z: Int;
}

contract DeepContract {
    nested: DeepC;
    
    init() {
        self.nested = DeepC{
            b: DeepB{
                a: DeepA{x: 7},
                y: true
            },
            z: 13
        };
    }
}