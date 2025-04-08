struct InnerLayer {
    foo: String;
    bar: Int;
    baz: Bool;
}

struct MidLayer {
    inner: InnerLayer;
    count: Int;
}

contract ComplexTest {
    data: MidLayer;

    init() {
        self.data = MidLayer{
            inner: InnerLayer{
                foo: "abc",
                bar: 55,
                baz: true
            },
            count: 99
        };
    }
}