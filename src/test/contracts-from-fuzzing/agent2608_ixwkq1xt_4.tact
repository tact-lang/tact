struct A {
    val1: Int;
    b: B;
}

struct B {
    val2: Int;
    c: C;
}

struct C {
    val3: Int;
    d: D;
}

struct D {
    val4: Int;
    e: E;
}

struct E {
    val5: Int;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            val1:1,
            b: B{
                val2:2,
                c: C{
                    val3:3,
                    d: D{
                        val4:4,
                        e: E{
                            val5:5
                        }
                    }
                }
            }
        };
    }
}
