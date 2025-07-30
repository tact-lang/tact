struct DefaultedStruct {
    val1: Int = 1;
    val2: Int = 2;
    val3: Int = 3;
}

contract TestStorage {
    data: DefaultedStruct;

    init() {
        self.data = DefaultedStruct{};
    }
}