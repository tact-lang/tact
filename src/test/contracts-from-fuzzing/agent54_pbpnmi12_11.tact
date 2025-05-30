struct DefaultsTest2 {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "s";
}

contract ContractWithDefaults2 {
    d: DefaultsTest2;

    init() {
        self.d = DefaultsTest2{};
    }
}