// Long chain of nested structs inside a struct
struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { f: F; }
struct F { g: G; }
struct G { h: H; }
struct H { val: Int; }

contract TestContract {
    data: A;
    init() {
        self.data = A{ b: B{ c: C{ d: D{ e: E{ f: F{ g: G{ h: H{ val: 123 } } } } } } } };
    }
}