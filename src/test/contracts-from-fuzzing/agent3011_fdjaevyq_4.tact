struct A {
    m: Bool;
    n: Int?;
    s: String;
}

contract OptionalStructFieldTest {
    foo: A;
    init() {
        self.foo = A{ m: false, n: null, s: "hi" };
    }
}