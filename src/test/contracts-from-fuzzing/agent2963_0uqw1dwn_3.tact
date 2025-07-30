struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

struct C {
    c: Int;
    b: B;
}

contract ManyNestedOptional {
    opt: C?;

    init() {
        self.opt = C{
            c: 1,
            b: B{
                b: 2,
                a: A{
                    a: 3
                }
            }
        };
    }
}
