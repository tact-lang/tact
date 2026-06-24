struct SOpt {
    foo: Int?;
    bar: Bool?;
    baz: Cell?;
}

contract StructOptionalsTest {
    s: SOpt;
    init() {
        self.s = SOpt{ foo: null, bar: null, baz: null };
    }
}