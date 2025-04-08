struct A {
    i: Int;
}

struct B {
    a: A;
    b: A;
}

contract ManyStructs {
    s1: A;
    s2: A;
    s3: B;
    s4: B;

    init() {
        self.s1 = A{i:1};
        self.s2 = A{i:2};
        self.s3 = B{a:A{i:3}, b:A{i:4}};
        self.s4 = B{a:A{i:5}, b:A{i:6}};
    }
}