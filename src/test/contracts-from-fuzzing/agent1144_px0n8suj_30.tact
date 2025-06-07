// test non-conflicting mix of default-initialized and init-assigned fields
contract InitAndDefaults {
    a: Int = 7;
    b: String;
    c: Bool = false;

    init() {
        self.b = "yo";
    }
}