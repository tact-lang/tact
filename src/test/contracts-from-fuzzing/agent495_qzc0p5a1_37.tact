// deeply nested struct chain with optionals on different levels
struct A { b: B? }
struct B { c: C }
struct C { d: D? }
struct D { e: E }
struct E { val: Int? }

contract Chain {
    f: A;
    init() {
        self.f = A{ b: null };
    }
}