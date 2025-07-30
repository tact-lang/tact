struct A { x: Int }

struct B {
    p: A;
    q: Int;
}

struct C {
    nested: B;
    s: String
}

contract Test {
    data: C;
    init() {
        self.data = C{ nested: B{ p: A{ x: 1 }, q:2 }, s: "abc" };
    }
}
