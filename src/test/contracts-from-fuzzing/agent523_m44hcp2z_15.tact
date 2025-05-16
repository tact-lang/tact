struct S { a: Int; b: Int; c: Int; }

contract ManyFields {
    f1: S;
    f2: S;
    f3: S;

    init() {
        self.f1 = S{a:1,b:2,c:3};
        self.f2 = S{a:4,b:5,c:6};
        self.f3 = S{a:7,b:8,c:9};
    }
}
