struct HasManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int?; // defaults null
    e: Bool?; // defaults null
}

contract TestDefaultsOmit {
    val: HasManyDefaults;

    init() {
        self.val = HasManyDefaults{};
    }
}