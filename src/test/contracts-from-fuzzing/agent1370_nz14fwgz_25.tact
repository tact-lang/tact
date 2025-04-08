// Persistent optional fields with default null assignment omitted
contract OptionalsImplicitNull {
    a: Int?;
    b: String?;

    init() {
        self.a = null;
        self.b = null;
    }
}