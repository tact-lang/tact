struct A {x: Int}
struct B {a: A}
struct C {b: B}
struct D {c: C}

contract TestChainNesting {
    field: D;

    init() {
        self.field = D{ c:C{b:B{a:A{x:5}}} };
    }
}