struct A { next: B; }
struct B { next: C; }
struct C { next: D; }
struct D { val: Int; }

contract DeepChain {
    head: A;

    init() {
        self.head = A {
            next: B {
                next: C {
                    next: D {
                        val: 123
                    }
                }
            }
        };
    }
}