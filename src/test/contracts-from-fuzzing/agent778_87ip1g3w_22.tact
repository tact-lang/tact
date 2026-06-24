struct Sopt {
    x: Int?;
    y: Bool;
}

struct Sreg {
    a: Int;
    b: Bool?;
}

contract MixOptReg {
    one: Sopt;
    two: Sreg;
    init() {
        self.one = Sopt{ x: null, y: true };
        self.two = Sreg{ a: 42, b: null };
    }
}