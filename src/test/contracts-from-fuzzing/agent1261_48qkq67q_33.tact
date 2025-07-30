struct A {
    next: B?;
}

struct B {
    next: C?;
}

struct C {
    val: Int;
}

contract LongChainOptionals {
    head: A;

    init() {
        self.head = A{
            next: B{
                next: C{
                    val: 42
                }
            }
        };
    }
}