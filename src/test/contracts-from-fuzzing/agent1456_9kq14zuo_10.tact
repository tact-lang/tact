struct DefaultsStruct {
    a: Int = 10;
    b: String = "hello";
    c: Bool = true;
}

contract DefaultsContract {
    storage: DefaultsStruct;

    init() {
        self.storage = DefaultsStruct{}; // Use all defaults
    }
}
