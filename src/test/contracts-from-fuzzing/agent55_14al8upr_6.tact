struct E {
    val: Int;
}

struct D {
    val: Int;
    next: E;
}

struct C {
    val: Int;
    next: D;
}

struct B {
    val: Int;
    next: C;
}

struct A {
    val: Int;
    next: B;
}

contract TestDeepChain {
    init() {
        let instance = A {
            val: 1,
            next: B {
                val: 2,
                next: C {
                    val: 3,
                    next: D {
                        val: 4,
                        next: E { val: 5 }
                    }
                }
            }
        };
    }
}
