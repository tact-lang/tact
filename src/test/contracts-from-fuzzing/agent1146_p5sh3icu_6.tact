struct S1 {
    a: Int?;
}

struct S2 {
    inner: S1?;
    value: Bool;
}

contract OptionalStructTest {
    s: S2;

    init() {
        self.s = S2{
            inner: null,
            value: true
        };
    }
}