struct A { x: Int; }
struct B { x: Int; }
struct C { a: A; b: B; }

contract SameFieldNames {
    c: C;
    init() {
        self.c = C{ a: A{x:1}, b: B{x:2} };
    }
}