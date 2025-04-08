struct OptionalNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract NestedOptionalContract {
    p: OptionalNested?;

    init() {
        self.p = null;
    }
}