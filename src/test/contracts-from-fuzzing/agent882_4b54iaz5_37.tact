struct A { v: Int; }
struct B { v: A; }
struct C { v: B; }
struct D { v: C; }
struct E { v: D; }

contract ChainContract {
    val: E;

    init() {
        self.val = E{ v: D{ v: C{ v: B{ v: A{ v: 1 }}}}};
    }
}