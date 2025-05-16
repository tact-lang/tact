struct A {
    val: Int;
}

struct B {
    val: Int;
    next: A?;
}

struct C {
    head: B?;
}

contract OptionalChain {
    chain: C;
    init() {
        self.chain = C{
            head: B{
                val: 1,
                next: A{val:2}
            }
        };
    }
}