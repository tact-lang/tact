// Long linear chain of nested structs, each with a single Int field

struct A { x: Int; }
struct B { x: A; }
struct C { x: B; }
struct D { x: C; }
struct E { x: D; }
struct F { x: E; }
struct G { x: F; }
struct H { x: G; }
struct I { x: H; }
struct J { x: I; }

contract TestContract {
    data: J;
    init() {
        self.data = J{ x: I{ x: H{ x: G{ x: F{ x: E{ x: D{ x: C{ x: B{ x: A{ x: 7 } } } } } } } } } };
    }
}