struct Defaults {
    val1: Int = 1;
    val2: String = "abc";
    val3: Bool = false;
}

contract StructDefaults {
    rec: Defaults;

    init() {
        self.rec = Defaults{};
    }
}