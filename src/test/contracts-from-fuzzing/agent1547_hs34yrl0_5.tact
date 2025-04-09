struct A {
    inner: B;
}

struct B {
    nested: C;
}

struct C {
    inside: D;
}

struct D {
    val: E;
}

struct E {
    finalVal: Int;
}

contract ChainTest {
    chain: A;

    init() {
        self.chain = A{
            inner: B{
                nested: C{
                    inside: D{
                        val: E{ finalVal: 123 }
                    }
                }
            }
        };
    }
}