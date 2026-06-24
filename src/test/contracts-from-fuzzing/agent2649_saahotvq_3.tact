struct A {
    i: Int;
}

struct B {
    a: A;
    flag: Bool;
}

struct C {
    b: B;
    val: Int;
}

contract DeepChain {
    state: C;

    init() {
        self.state = C{
            b: B{
                a: A{
                    i: 11,
                },
                flag: true,
            },
            val: 99,
        };
    }
}