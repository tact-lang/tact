// Very deeply nested struct chain with optional field nested several layers
struct A { a: Int; }
struct B { b: A?; }
struct C { c: B?; }
struct D { d: C?; }

contract DeepOptionalChain {
    f: D;

    init() {
        self.f = D {
            d: null
        };
    }
}