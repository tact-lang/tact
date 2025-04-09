struct S {
    x: Int;
    y: Bool;
}

contract TestContract {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{x: 1, y: true};
        self.s2 = S{x: 2, y: false};
    }
}