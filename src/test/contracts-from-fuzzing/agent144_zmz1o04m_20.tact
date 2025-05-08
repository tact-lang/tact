struct PartialDefaults {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;
}

contract PartiallySetDefaults {
    vals: PartialDefaults;
    init() {
        self.vals = PartialDefaults{
            val1: 42
            // val2, val3 omitted to default
        };
    }
}