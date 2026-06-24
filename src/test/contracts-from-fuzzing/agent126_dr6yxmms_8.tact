struct SerialDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
}

contract DefaultsStructField {
    s: SerialDefaults;

    init() {
        self.s = SerialDefaults{};
    }
}