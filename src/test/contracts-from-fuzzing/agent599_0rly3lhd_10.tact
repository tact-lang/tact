struct A {
    a1: Int;
    a2: Int;
}

struct B {
    b1: Int;
    a_embed: A;
    b2: Int;
}

contract TestContract {
    storage: B;

    init() {
        self.storage = B{
            b1: 10,
            a_embed: A{a1: 20, a2: 30},
            b2: 40
        };
    }
}