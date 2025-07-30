struct S {
    x: Int;
    y: Bool;
}

contract Defaults {
    f: S = S{ x: 10, y: true };

    init() {
        self.f = S{ x: 42, y: false };
    }
}