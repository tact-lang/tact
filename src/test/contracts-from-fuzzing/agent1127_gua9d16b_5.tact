struct OneField { only: Int }
struct TwoField { a: Int; b: Int }
struct ThreeField { a: Int; b: Int; c: Int }

contract ManyGroups {
    f1: OneField;
    f2: TwoField;
    f3: ThreeField;

    init() {
        self.f1 = OneField{ only: 1 };
        self.f2 = TwoField{ a:2, b:3 };
        self.f3 = ThreeField{ a:4, b:5, c:6 };
    }
}