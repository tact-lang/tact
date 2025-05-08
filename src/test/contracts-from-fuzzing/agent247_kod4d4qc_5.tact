struct A {
    val: Int;
    next: B?;
}

struct B {
    val: Int;
    next: C?;
}

struct C {
    val: Int;
    name: String;
}

contract LongChain {
    chain: A;
    init() {
        self.chain = A{
            val: 1,
            next: B{
                val: 2,
                next: C{
                    val: 3,
                    name: "end"
                }
            }
        };
    }
}