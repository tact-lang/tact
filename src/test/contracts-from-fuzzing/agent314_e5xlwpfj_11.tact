struct OptionalAndDefaults {
    val1: Int?;
    val2: Int = 5;
    val3: String?;
    val4: String = "hi";
    val5: Bool?;
    val6: Bool = true;
}

contract TestContract {
    combo: OptionalAndDefaults;

    init() {
        self.combo = OptionalAndDefaults{
            val1: null,
            val3: null,
            val5: null
        };
    }
}