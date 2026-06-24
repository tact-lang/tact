struct A { x: Int; y: Int }
struct B { a: A; z: Int }
struct C { b: B; w: Int }

contract Test {
    c: C;

    init() {
        self.c = C{ b: B{ a: A{ x:1, y:2 }, z:3 }, w:4 };
    }
}