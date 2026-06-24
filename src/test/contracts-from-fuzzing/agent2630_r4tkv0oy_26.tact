struct DeepCombo {
    a: Int;
    b: MiddleCombo;
}

struct MiddleCombo {
    c: Int?;
    d: InnerCombo;
}

struct InnerCombo {
    e: Bool;
    f: String?;
}

contract MixedDeep {
    payload: DeepCombo;

    init() {
        self.payload = DeepCombo{
            a: 1,
            b: MiddleCombo{
                c: null,
                d: InnerCombo{
                    e: true,
                    f: null
                }
            }
        };
    }
}