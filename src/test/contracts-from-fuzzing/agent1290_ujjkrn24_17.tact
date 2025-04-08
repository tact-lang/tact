struct Defaults {
    val: Int = 5;
    flag: Bool = true;
    txt: String = "hi";
    optText: String? = null;
}

contract StructDefaults {
    s: Defaults;
    init() {
        self.s = Defaults{};
    }
}