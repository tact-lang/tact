struct A { f: Int }
struct B { f: Int }
struct C { a: A; b: B }

contract ContainTwoStructs {
    s: C;

    init() {
        self.s = C{ a: A{f:1}, b: B{f:2} };
    }
}
