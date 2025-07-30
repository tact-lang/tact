struct A { val: Int = 1; }
struct B { val: A; }
struct C { val: B; }
struct D { val: C; }
struct E { val: D; }

contract Chain {
    data: E;

    init() {
        self.data = E{ val: D{ val: C{ val: B{ val: A{} } } } };
    }
}