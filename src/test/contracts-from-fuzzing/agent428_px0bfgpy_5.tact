struct DeepA {
    b: DeepB;
}

struct DeepB {
    c: DeepC;
}

struct DeepC {
    d: Int;
    e: Bool;
}

contract FourLevelNested {
    data: DeepA;

    init() {
        self.data = DeepA{
            b: DeepB{
                c: DeepC{
                    d: 123,
                    e: true
                }
            }
        };
    }
}
