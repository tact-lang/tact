struct Container {
    foo: Int;
}

contract MixedOrdering {
    a: Int;
    s: Container;
    b: Bool;
    t: String;
    c: Int;

    init() {
        self.a = 1;
        self.s = Container{ foo: 2 };
        self.b = true;
        self.t = "x";
        self.c = 3;
    }
}