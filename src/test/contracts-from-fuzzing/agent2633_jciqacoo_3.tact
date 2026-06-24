struct OneField {
    n: Int;
}

struct TwoField {
    f1: OneField;
    f2: Bool;
}

struct ThreeField {
    f1: TwoField;
    f2: String;
    f3: Address;
}

contract ManyLayers {
    nested: ThreeField;

    init() {
        self.nested = ThreeField{
            f1: TwoField{
                f1: OneField{
                    n: 7,
                },
                f2: true,
            },
            f2: "hi",
            f3: myAddress(),
        };
    }
}
