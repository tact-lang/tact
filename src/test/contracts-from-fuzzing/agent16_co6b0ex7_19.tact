struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: F; }
struct F { num: Int; }

contract DeepChain {
    val: A;

    init() {
        self.val = A{ b: B{ c: C{ d: D{ e: E{ f: F{ num: 99 } } } } } };
    }
}