struct OneField {
    a: Int;
}

struct TwoField {
    b: Int;
    c: Bool;
}

contract DiffStructs {
    s1: OneField;
    s2: TwoField;
    init() {
        self.s1 = OneField{ a:1 };
        self.s2 = TwoField{ b: 2, c: true };
    }
}