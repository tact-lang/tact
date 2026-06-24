// Optional contract-level field
contract OptionalTest {
    foo: Int?;
    bar: Bool?;
    buz: String?;

    init() {
        self.foo = null;
        self.bar = true;
        self.buz = null;
    }
}