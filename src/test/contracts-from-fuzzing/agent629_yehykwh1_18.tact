struct A { f: Int }
struct B { f: Int }
struct C { a: A; b: B }

contract Test {
    c: C;
    init() {
        self.c = C{ a: A{f:1}, b: B{f:2} };
    }
}
