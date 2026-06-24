struct OneField { value: Int }
struct TwoField { a: Int; b: Int }
struct ThreeField { a: Int; b: Int; c: Int }

contract ManyStructs {
    s1: OneField;
    s2: TwoField;
    s3: ThreeField;

    init() {
        self.s1 = OneField{ value:1 };
        self.s2 = TwoField{ a:2, b:3 };
        self.s3 = ThreeField{ a:4, b:5, c:6 };
    }
}