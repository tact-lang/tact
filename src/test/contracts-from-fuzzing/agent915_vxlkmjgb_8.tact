struct VariantA {
    x: Int;
    y: Bool;
}

struct VariantB {
    a: VariantA;
    b: Int;
}

struct VariantC {
    ab: VariantB;
    c: String;
}

contract DeepMarshalFields {
    content: VariantC;

    init() {
        self.content = VariantC{
            ab: VariantB{
                a: VariantA{ x: 12, y: false },
                b: 99
            },
            c: "test"
        };
    }
}
