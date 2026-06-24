struct A {
    ai: Int;
    ab: Bool;
}

struct B {
    bi: Int;
    bb: Bool;
    asub: A;
}

struct C {
    ci: Int;
    csub: B;
}

contract NestedDiffTypes {
    nested: C;

    init() {
        self.nested = C{
            ci: 1,
            csub: B{
                bi: 2,
                bb: false,
                asub: A{ ai:3, ab:true }
            }
        };
    }
}
