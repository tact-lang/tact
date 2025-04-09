struct Walt {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
}

struct Jesse {
    w: Walt;
    message: String;
}

contract BreakingBad {
    data: Jesse;
    init() {
        self.data = Jesse{ w: Walt{ a:1, b:2, c:3, d:4, e:5 }, message: "say my name" };
    }
}