struct A { v: Int; }
struct B { f: A; }
struct C { f: B; }
struct D { f: C; }
struct E { f: D; }
struct F { f: E; }

contract UltraDeep {
    val: F;

    init() {
        self.val = F{ f: E{ f: D{ f: C{ f: B{ f: A{ v: 100 } } } } } };
    }
}
