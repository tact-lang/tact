struct A {
    num: Int = 1;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepStructChain {
    top: C;

    init() {
        self.top = C{
            b: B{
                a: A{ num: 1234 }
            }
        };
    }
}