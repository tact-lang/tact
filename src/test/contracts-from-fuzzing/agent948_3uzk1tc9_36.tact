// Deeply nested mixed optional and non optional fields
struct DeepA {
    x: Int?;
    y: String;
}

struct DeepB {
    a: DeepA;
    z: Bool?;
}

struct DeepC {
    b: DeepB;
    note: String?;
}

contract DeepMixOpt {
    data: DeepC;

    init() {
        self.data = DeepC{
            b: DeepB{
                a: DeepA{
                    x: null,
                    y: "yyy"
                },
                z: true
            },
            note: null
        };
    }
}