struct A {
    b: Int as uint32;
    c: Int as int64;
    d: Int = 999;
}

contract SerializeTest {
    data: A;

    init() {
        self.data = A{
            b: 1,
            c: -100,
            d: 500
        };
    }
}
