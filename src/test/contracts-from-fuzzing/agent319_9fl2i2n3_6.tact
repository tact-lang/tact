struct Defaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "Hello";
    d: Int?; // implicit default null
}

contract StructWithDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}