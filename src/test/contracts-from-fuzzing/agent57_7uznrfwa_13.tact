struct DefaultsStruct {
    val1: Int = 5;
    val2: String = "def";
    val3: Bool = true;
    val4: Int? = null;
}

contract DefaultsUsage {
    data: DefaultsStruct;

    init() {
        self.data = DefaultsStruct{};
    }
}