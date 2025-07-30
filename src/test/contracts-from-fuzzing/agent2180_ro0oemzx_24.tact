struct A {
    q: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract OptChain {
    state: C;

    init() {
        self.state = C{
            b: null
        };
    }
}