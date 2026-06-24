// Contract with flat list of various optional fields, initialized
contract FlatOptionalTest {
    foo: Int?;
    bar: Bool?;
    baz: String?;
    qux: Int?;
    qwe: Bool?;
    rty: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.baz = null;
        self.qux = null;
        self.qwe = null;
        self.rty = null;
    }
}