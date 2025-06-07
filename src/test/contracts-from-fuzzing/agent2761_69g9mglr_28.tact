struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

contract ManySimpleStructs {
    sa: A;
    sb: B;
    sc: C;

    init() {
        self.sa = A{a: 2};
        self.sb = B{b: 3};
        self.sc = C{c: 4};
    }
}
