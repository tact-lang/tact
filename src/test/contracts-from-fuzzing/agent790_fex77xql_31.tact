struct A { i: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }
struct F { e: E; }
struct G { f: F; }
struct H { g: G; }

contract EightDeep {
    data: H;

    init() {
        self.data = H{g: G{f: F{e: E{d: D{c: C{b: B{a: A{i:0}}}}}}}};
    }
}