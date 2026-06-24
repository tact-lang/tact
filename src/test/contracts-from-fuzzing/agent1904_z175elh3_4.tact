struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Test {
    value: C;

    init() {
        self.value = C{
            b: B{
                a: A{
                    x: 100
                }
            }
        };
    }
}