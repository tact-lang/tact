struct A {
    n: Int;
}

struct B {
    inner: A;
}

struct C {
    deep: B;
}

contract MultiStructChain {
    chain: C;

    init() {
        self.chain = C{
            deep: B{
                inner: A{ n: 777 }
            }
        };
    }
}
