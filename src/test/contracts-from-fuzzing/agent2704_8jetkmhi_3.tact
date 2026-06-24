struct OptionalNest {
    val1: Int?;
    flag: Bool?;
}

contract OptionalNestedField {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val1: null,
            flag: true,
        };
    }
}