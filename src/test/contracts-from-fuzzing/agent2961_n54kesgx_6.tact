struct A { x: Int; }
struct B { a: A; y: Bool; }
struct C { b: B; z: String; }

contract ChainNest {
    c: C;
    init() {
        self.c = C{ b: B{ a: A{ x: 1 }, y: true }, z: "ok" };
    }
}
