struct A { i: Int; b: Bool }
struct B { a: A; s: String }
struct C { b: B; c: Bool? }

contract TestContract {
    outer1: C;
    outer2: C;

    init() {
        self.outer1 = C{
            b: B{ a: A{i:1, b:true}, s:"first" },
            c: null
        };
        self.outer2 = C{
            b: B{ a: A{i:2, b:false}, s:"second" },
            c: true
        };
    }

    receive() {}
}