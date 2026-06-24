struct OptionalDefault {
    a: Int?;     // should default to null
    b: Bool?;    // should default to null
    c: String?;  // should default to null
}

contract ImplicitNulls {
    val: OptionalDefault;

    init() {
        self.val = OptionalDefault{};
    }
}