struct A {
    value: Int;
    next: B?;
}
struct B {
    value: Int;
    next: C?;
}
struct C {
    value: Int;
}

contract DeepOptionChain {
    chain: A;
    init() {
        self.chain = A{
            value: 1,
            next: B{
                value: 2,
                next: C{
                    value: 3
                }
            }
        };
    }
}