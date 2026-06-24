struct A {
    a: Int;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract NestedStructTest {
    storage: C;

    init() {
        self.storage = C{
            c: B{
                b: A{
                    a: 42
                }
            }
        };
    }
}