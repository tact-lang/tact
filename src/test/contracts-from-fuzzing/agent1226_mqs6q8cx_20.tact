struct Wrap {
    a: Bool;
    b: Int;
}

contract Defaults {
    x: Int = 1;
    s: Wrap = Wrap{ a: true, b: 2 };

    init() {
        self.x = 42; // override
        self.s = Wrap{ a: false, b: 3 };
    }
}