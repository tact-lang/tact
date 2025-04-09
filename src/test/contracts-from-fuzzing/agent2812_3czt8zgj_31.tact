struct OneField { x: Int; }

contract DefaultsAndEmpty {
    s: OneField = OneField{ x: 42 };
    b: Bool;

    init() {
        self.b = true;
    }
}