struct A {
    nested: B;
}

struct B {
    nested: C;
}

struct C {
    x: Int;
    y: Bool;
}

contract MultiNestingStructs {
    a: A;
    init() {
        self.a = A{
            nested: B{
                nested: C{
                    x:1,
                    y:true,
                }
            }
        };
    }
}