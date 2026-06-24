// contract with fields without default value, one optional
contract PartialDefaults {
    a: Int;
    b: String;
    c: Bool?;

    init() {
        self.a = 1;
        self.b = "test";
        self.c = null;
    }
}
