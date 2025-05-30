struct A {
    v: Int;
}

struct B {
    s: A?;
}

struct C {
    t: B?;
}

contract ChainOptionals {
    chain: C;

    init() {
        self.chain = C{ t: null };
    }
}
