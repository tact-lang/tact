struct A {
    x: Int;
}
struct B {
    y: Int;
    sub: A;
}
struct C {
    z: Int;
    sub: B;
}

contract NestedChains {
    chain: C;
    init() {
        self.chain = C{
            z: 7,
            sub: B{
                y: 6,
                sub: A{
                    x: 5,
                },
            },
        };
    }
}