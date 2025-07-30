struct A { a1: Int; a2: Int }
struct B { b1: Int; b2: Int }
struct C { c1: A; c2: B }

contract StructWithNestedStructs {
    c: C;

    init() {
        self.c = C{
            c1: A{a1:1,a2:2},
            c2: B{b1:3,b2:4},
        };
    }
}