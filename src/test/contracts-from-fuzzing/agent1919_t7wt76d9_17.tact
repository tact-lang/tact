struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D;
}

struct D {
    e: E;
}

struct E {
    val1: Int;
    val2: Bool?;
    val3: String?;
}

contract TestContract {
    nested: A;
    init() {
        self.nested = A{
            b: B{
                c: C{
                    d: D{
                        e: E{
                            val1: 5,
                            val2: true,
                            val3: null
                        }
                    }
                }
            }
        };
    }
}