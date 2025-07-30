struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

contract ManyStructFields {
    s1: A;
    s2: B;
    s3: C;

    init() {
        self.s1 = A{a:1};
        self.s2 = B{b:2};
        self.s3 = C{c:3};
    }
}
