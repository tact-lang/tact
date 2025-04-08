struct A { val: Int; }
struct B { val: A; }
struct C { val: B; }
struct D { val: C; }
struct E { val: D; }

contract Deep5 {
    f: E;

    init() {
        self.f = E{ val: D{ val: C{ val: B{ val: A{ val: 1 } } } } };
    }
}