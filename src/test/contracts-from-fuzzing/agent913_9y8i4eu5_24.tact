// Attempt a very deeply nested optional chain

struct A { b: B?; }
struct B { c: C?; }
struct C { d: D?; }
struct D { e: E?; }
struct E { f: F?; }
struct F { g: G?; }
struct G { h: H?; }
struct H { i: Int?; }

contract TestContract {
    root: A;
    init() {
        self.root = A{ b: null };
    }
}