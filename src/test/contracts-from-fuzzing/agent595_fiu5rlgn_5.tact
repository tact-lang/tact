struct OneField {
    x: Int;
}

struct TwoField {
    a: Int;
    b: OneField;
}

struct ThreeField {
    a: Int;
    b: TwoField;
}

contract DeepChain {
    f: ThreeField;

    init() {
        self.f = ThreeField{
            a: 1,
            b: TwoField{
                a: 2,
                b: OneField{ x: 3 }
            }
        };
    }
}