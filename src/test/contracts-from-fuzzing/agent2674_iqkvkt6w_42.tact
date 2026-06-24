// unusual ordering and optional nesting
struct C {
    z: Int = 3;
}

struct B {
    y: Int? = null;
    c: C;
}

struct A {
    x: Int? = null;
    b: B;
}

contract DisorderedOptionalFlatten {
    nested: A;

    init() {
        self.nested = A{
            x:null,
            b:B{
                y:null,
                c:C{},
            }
        };
    }
}