struct A { x: Int; }
struct B { x: A; }
struct C { x: B; }
struct D { x: C; }
struct E { x: D; }
struct F { x: E; }

contract NestedDeep {
    val: F;
    init() {
        self.val = F{ x: E{ x: D{ x: C{ x: B{ x: A{ x: 1 }}}}}};
    }
}