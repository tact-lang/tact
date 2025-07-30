struct A {
    val: Int;
    optB: B?;
}

struct B {
    val: Bool;
    optC: C?;
}

struct C {
    amount: Int;
}

contract ChainOptional {
    data: A;

    init() {
        self.data = A{
            val: 5,
            optB: B{
                val: false,
                optC: C{
                    amount: 123
                }
            }
        };
    }
}