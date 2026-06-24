struct TestX {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}
struct TestY {
    inner: TestX?;
    count: Int;
}

contract OptionalChains {
    t: TestY?;
    init() {
        self.t = null;
    }
}