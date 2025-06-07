struct X {
    a: Int;
}

contract Top {
    x1: X;
    x2: X;
    x3: X;
    x4: X;

    init() {
        self.x1 = X{a:1};
        self.x2 = X{a:2};
        self.x3 = X{a:3};
        self.x4 = X{a:4};
    }
}
