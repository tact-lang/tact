struct A { x: Int; }
struct B { a: A?; }
struct C { b: B?; }

contract Test {
    c: C;

    init() {
        self.c = C{ b: null };
    }
}