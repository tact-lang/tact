struct A {
    b: B;
}

struct B {
    c: C?;
}

struct C {
    value: Int;
}

contract ChainStructs {
    chain: A;

    init() {
        self.chain = A{
            b: B{c: null}
        };
    }
}
