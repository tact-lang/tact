struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ChainTest {
    content: C;

    init() {
        self.content = C{
            b: B{
                a: A{
                    x: 42
                }
            }
        };
    }
}