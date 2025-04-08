struct A {
    a1: Int;
    a2: Bool;
}

struct B {
    b1: A;
    b2: A;
}

contract DuplicateNested {
    nested: B;
    init() {
        self.nested = B{
            b1: A{ a1:1, a2:true },
            b2: A{ a1:2, a2:false }
        };
    }
}