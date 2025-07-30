struct OptionalNest {
    val: Int?;
    note: String?;
}

contract OptionalFields {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            val: null,
            note: null
        };
    }
}