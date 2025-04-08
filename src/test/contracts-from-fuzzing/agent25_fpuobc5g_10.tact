struct L {
    x: Int;
}
struct K {
    x: Int;
    inner: L;
}
struct J {
    x: Int;
    inner: K;
}
struct I {
    x: Int;
    inner: J;
}

contract Test {
    deeply_nested: I;
    init() {
        self.deeply_nested = I{
            x:1,
            inner: J{
                x:2,
                inner: K{
                    x:3,
                    inner: L{ x:4 }
                }
            }
        };
    }
}