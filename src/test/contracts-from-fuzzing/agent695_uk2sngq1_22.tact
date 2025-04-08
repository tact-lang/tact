struct Small {
    n: Int;
}

contract ManyStructVars {
    a: Small;
    b: Small;
    c: Small;
    d: Small;

    init() {
        self.a = Small{n:1};
        self.b = Small{n:2};
        self.c = Small{n:3};
        self.d = Small{n:4};
    }
}