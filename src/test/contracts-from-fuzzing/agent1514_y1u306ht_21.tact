struct A { x: Int; }
struct B { y: Int; }
struct C { a: A; b: B; }

contract Test {
    field: C = C{a:A{x:1}, b:B{y:2}};
    init() {
        self.field = C{a:A{x:3}, b:B{y:4}};
    }
}