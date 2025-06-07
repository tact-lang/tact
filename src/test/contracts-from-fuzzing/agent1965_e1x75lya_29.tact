struct A { a: Int }
struct B { b: Int }
struct C { c: Int }

contract ManySeparateFields {
    fa: A;
    fb: B;
    fc: C;
    init() {
        self.fa = A{a:1};
        self.fb = B{b:2};
        self.fc = C{c:3};
    }
}