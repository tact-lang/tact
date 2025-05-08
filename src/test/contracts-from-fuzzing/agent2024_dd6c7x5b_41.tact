struct Sinner {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalNullableDefaults {
    data: Sinner? = null;

    init() {
        self.data = null;
    }
}