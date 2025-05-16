struct A {
    val: Int as uint8;
}
struct B {
    a: A;
    val: Int as uint16;
}
struct C {
    b: B;
    val: Int as uint32;
}

contract NestedSerialization {
    payload: C;
    init() {
        self.payload = C{
            b: B{
                a: A{val: 12},
                val: 1234
            },
            val: 56789
        };
    }
}
