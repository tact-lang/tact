// Deep optional chains not nested optionals
struct A {
    optInt: Int?;
}

struct B {
    optA: A?;
}

contract TestOptionalChain {
    chain: B;

    init() {
        self.chain = B{ optA: null };
    }

    receive() {
        self.chain = B{ optA: A{ optInt: 88 } };
    }
}