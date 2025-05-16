struct A { f: Int }
struct B { f: Int }
struct C { a: A; b: B }

contract CrossStructs {
    storage: C;

    init() {
        self.storage = C{
            a: A{f:1},
            b: B{f:2},
        };
    }
}