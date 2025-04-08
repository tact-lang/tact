struct A { v1: Int; }
struct B { v2: Int; }
struct C { v3: Int; }

contract NestedStructsFlat {
    fa: A;
    fb: B;
    fc: C;

    init() {
        self.fa = A{v1:1};
        self.fb = B{v2:2};
        self.fc = C{v3:3};
    }
}