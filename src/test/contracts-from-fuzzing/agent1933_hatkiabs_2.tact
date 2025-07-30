struct Inner {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
}

contract NestedFieldTest {
    data: Inner;

    init() {
        self.data = Inner{
            a: 1,
            b: true,
            c: "hello",
            d: null,
        };
    }
}