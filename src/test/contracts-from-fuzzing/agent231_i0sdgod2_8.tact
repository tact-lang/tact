struct Defaults {
    i: Int = 5;
    b: Bool = true;
    s: String = "yep";
    o: Int?;  // defaults to null
}

contract StructWithDefaults {
    field: Defaults;

    init() {
        self.field = Defaults{};
    }
}