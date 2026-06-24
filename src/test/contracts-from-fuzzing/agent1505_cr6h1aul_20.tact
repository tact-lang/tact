struct OneField { x: Int; }
struct TwoField { y: Int; }

contract StructSwap {
    a: OneField;
    b: TwoField;
    init() {
        self.a = OneField{ x: 1 };
        self.b = TwoField{ y: 2 };
    }
}