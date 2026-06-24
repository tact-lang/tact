struct DefaultVals {
    intVal: Int = 5;
    boolVal: Bool = true;
    strVal: String = "hello";
    optInt: Int?; // null
    optStr: String?; // null
}

contract DefaultsContract {
    state: DefaultVals;

    init() {
        self.state = DefaultVals{};
    }
}