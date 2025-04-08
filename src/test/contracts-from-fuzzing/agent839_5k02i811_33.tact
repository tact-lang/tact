struct First {
    a: Int;
}

struct Second {
    b: Bool;
}

contract TwoStructs {
    f: First;
    s: Second;
    init() {
        self.f = First{a:1};
        self.s = Second{b:true};
    }
}