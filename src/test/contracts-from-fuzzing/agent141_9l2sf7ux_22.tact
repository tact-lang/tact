struct DeepCombo {
    a: Int;
    b: InnerCombo;
}

struct InnerCombo {
    x: Int?;
    y: String;
    z: Bool?;
}

contract NestComplexOptional {
    dc: DeepCombo;

    init() {
        self.dc = DeepCombo{
            a: 4,
            b: InnerCombo{
                x:null,
                y: "xxx",
                z:null
            }
        };
    }
}