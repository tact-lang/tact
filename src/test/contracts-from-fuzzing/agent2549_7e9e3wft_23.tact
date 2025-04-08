struct Basic {
    x: Int;
    y: Bool;
}

contract MultiVars {
    a: Basic;
    b: Bool;
    c: Int;
    d: Basic;

    init() {
        self.a = Basic{x: 1, y: true};
        self.b = false;
        self.c = 42;
        self.d = Basic{x: 2, y: false};
    }
}