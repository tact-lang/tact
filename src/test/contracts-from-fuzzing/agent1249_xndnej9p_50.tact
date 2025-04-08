struct A {
    i: Int?
}

struct B {
    a: A?;
}

contract OptionalChain {
    chain: B?;

    init() {
        self.chain = null;
    }
}