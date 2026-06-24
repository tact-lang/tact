struct A { first: Int; second: Int; third: Int }
struct B { a: A; value: Int }
struct C { b: B; flag: Bool }

contract StructChain {
    chain: C;

    init() {
        self.chain = C{
            b: B{
                a: A{ first: 1, second: 2, third: 3 },
                value: 42
            },
            flag: true
        };
    }
}