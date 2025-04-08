struct D { x: Int; }
struct C { d: D; }
struct B { c: C; }
struct A { b: B; }

contract DeepNest {
    root: A = A { b: B { c: C { d: D { x: 77 } } } };

    init() {
        self.root = self.root;
    }

    receive() {
        self.root = self.root;
    }
}