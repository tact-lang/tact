struct A {
    v: Int;
}

struct B {
    inner: A;
}

struct C {
    inner: B;
}

struct D {
    inner: C;
}

struct E {
    inner: D;
}

contract Chain {
    data: E;

    init() {
        self.data = E{
            inner: D{
                inner: C{
                    inner: B{
                        inner: A{v: 42}
                    }
                }
            }
        };
    }
}
