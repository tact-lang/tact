struct E { z: Int? = null; }
struct D { e: E = E{}; }
struct C { d: D = D{}; }
struct B { c: C = C{}; }
struct A { b: B = B{}; }

contract DeepChains {
    root: A;

    init() {
        self.root = A{};
    }
}