struct WithDefaults {
    val1: Int = 0;
    val2: Bool = false;
    val3: Address? = null;
    val4: String = "hi";
}

contract Defaults {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            val1: 1,
            val2: true,
            val3: null,
            val4: "test"
        };
    }
}