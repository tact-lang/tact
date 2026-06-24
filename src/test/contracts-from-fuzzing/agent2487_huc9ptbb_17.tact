struct First {
    x: Int;
}

struct Second {
    y: Bool;
}

contract TestContract {
    f: First;
    s: Second;

    init() {
        self.f = First{ x: 1 };
        self.s = Second{ y: false };
    }
}