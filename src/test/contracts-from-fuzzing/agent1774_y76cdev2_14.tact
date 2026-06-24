struct A { a: Int; }
struct B { b: Int; nested: A; }
struct C { c: Int; nested: B; }

contract TestContract {
    f1: A;
    f2: B;
    f3: C;

    init() {
        self.f1 = A{a:1};
        self.f2 = B{b:2, nested: A{a:3}};
        self.f3 = C{c:4, nested: B{b:5, nested:A{a:6}}};
    }
}
