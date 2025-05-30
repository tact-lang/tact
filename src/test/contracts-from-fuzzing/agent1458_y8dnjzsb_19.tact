struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

contract Test {
    a: A?;
    b: B?;
    c: C?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}