struct A { b: B; }
struct B { c: C; }
struct C { val: Int; }

contract TestContract {
    a1: A;
    a2: A;

    init() {
        self.a1 = A{ b: B{ c: C{ val: 1 } } };
        self.a2 = A{ b: B{ c: C{ val: 2 } } };
    }
}
