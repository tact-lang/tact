struct A {
    a: Int;
}

struct B {
    b: Int;
}

contract ManyStructVars {
    v1: A;
    v2: B;
    v3: A;
    v4: B;

    init() {
        self.v1 = A{a:1};
        self.v2 = B{b:2};
        self.v3 = A{a:3};
        self.v4 = B{b:4};
    }
}