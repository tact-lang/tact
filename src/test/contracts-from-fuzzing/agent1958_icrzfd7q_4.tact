struct A {
    b: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract Chain {
    state: C;

    init() {
        self.state = C{
            b: B{
                a: A{
                    b:1
                }
            }
        };
    }
}
