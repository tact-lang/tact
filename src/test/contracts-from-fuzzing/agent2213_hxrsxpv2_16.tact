struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    val: Int?;
}

contract DeepChainOpt {
    f: A;

    init() {
        self.f = A{
            b: B{
                c: null
            }
        };
    }
}
