struct S {
    i: Int;
}

contract ManyDup {
    a: S;
    b: S;
    c: S;

    init() {
        self.a = S{i:1};
        self.b = S{i:2};
        self.c = S{i:3};
    }
}