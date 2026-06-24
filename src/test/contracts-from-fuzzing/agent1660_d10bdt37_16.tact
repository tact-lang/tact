struct A { x: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }
contract Test16 {
    val: F;
    init() {
        self.val = F{ e: E{ d: D{ c: C{ b: B{ a: A{ x:99 } } } } } };
    }
}