struct BoolDefaults {
    val1: Bool = true;
    val2: Bool = false;
    val3: Bool;
}

contract BoolDefaultTest {
    data: BoolDefaults;
    init() {
        self.data = BoolDefaults{
            val1: false,
            val2: true,
            val3: true,
        };
    }
}