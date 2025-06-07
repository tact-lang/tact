struct A { x: Int }
struct B { a: A }
struct C { b: B }
struct D { c: C }
struct E { d: D }

contract DeepFiveLevels {
    root: E;
    init() {
        self.root = E{d: D{c: C{b: B{a: A{x: 123}}}}};
    }
}