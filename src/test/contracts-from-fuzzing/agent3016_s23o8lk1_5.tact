struct OptionalAndDefaults {
    val1: Int?; // defaults to null
    val2: Bool = false;
    val3: String = "";
    val4: Int = 42;
}

contract TestContract {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{
            val1: null,
            val2: true,
            val3: "test",
            val4: 100,
        };
    }
}