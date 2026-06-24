struct A {
    a: Int;
}

struct B {
    b: Int;
    a: A;
}

contract StructOrder {
    s: B;

    init() {
        self.s = B{
            b: 1,
            a: A{
                a: 2
            }
        };
    }
}