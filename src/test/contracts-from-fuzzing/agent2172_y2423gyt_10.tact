struct A { sub: B; }
struct B { sub: C; }
struct C { val: Int; }

contract Chain {
    data: A;

    init() {
        self.data = A{ sub: B{ sub: C{ val: 42 } } };
    }
}