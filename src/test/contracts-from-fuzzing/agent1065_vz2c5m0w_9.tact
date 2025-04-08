struct OptionalPrimitives {
    n: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalDefaults {
    val: OptionalPrimitives;

    init() {
        self.val = OptionalPrimitives{};
    }
}
