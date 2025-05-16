struct OneField {
    a: Int;
}

struct TwoField {
    x: Int;
    y: OneField;
}

struct ThreeField {
    p: TwoField;
    q: OneField;
}

contract TestContract {
    d: ThreeField;

    init() {
        self.d = ThreeField{
            p: TwoField{
                x: 1,
                y: OneField{ a: 2 }
            },
            q: OneField{ a: 3 }
        };
    }
}