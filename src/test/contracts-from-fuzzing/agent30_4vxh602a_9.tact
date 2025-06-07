struct OneField { x: Int }

struct TwoField { x: Int; y: Int }

struct ThreeField { x: Int; y: Int; z: Int }

contract StructFieldsContract {
    a: OneField;
    b: TwoField;
    c: ThreeField;

    init() {
        self.a = OneField{ x: 1 };
        self.b = TwoField{ x: 2, y: 3 };
        self.c = ThreeField{ x:4, y:5, z:6 };
    }
}