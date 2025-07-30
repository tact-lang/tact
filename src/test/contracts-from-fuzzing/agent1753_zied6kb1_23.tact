struct A { f: Int; }
struct B { f: Int; }
struct C { f: Int; }

contract SameNames {
    s1: A;
    s2: B;
    s3: C;

    init() {
        self.s1 = A{f:1};
        self.s2 = B{f:2};
        self.s3 = C{f:3};
    }
}