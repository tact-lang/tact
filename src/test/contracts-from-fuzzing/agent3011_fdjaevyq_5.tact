struct A {
    m: Bool?;
    n: Int;
}

contract OptionalInStructTest {
    foo: A;
    init() {
        self.foo = A{ m: null, n: 999 };
    }
}