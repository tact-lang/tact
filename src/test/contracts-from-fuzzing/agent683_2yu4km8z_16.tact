struct OptionalNested {
    val: Int?;
    text: String?;
    flag: Bool?;
}

contract OptionalNestContract {
    nested: OptionalNested?;

    init() {
        self.nested = null;
    }
}