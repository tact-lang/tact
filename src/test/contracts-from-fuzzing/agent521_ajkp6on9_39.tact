struct S {
    i: Int;
}
contract ManyStructs {
    a: S;
    b: S;
    c: S;
    d: S;
    e: S;

    init() {
        self.a=S{i:1};
        self.b=S{i:2};
        self.c=S{i:3};
        self.d=S{i:4};
        self.e=S{i:5};
    }
}