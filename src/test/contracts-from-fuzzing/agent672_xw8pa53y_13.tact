struct Combination {
    foo: Int;
    bar: Bool?;
    baz: String;
    qux: Slice?;
}

contract MixedStructTest {
    data: Combination;
    init() {
        self.data = Combination{ foo: 5, bar: null, baz: "x", qux: null };
    }
}
