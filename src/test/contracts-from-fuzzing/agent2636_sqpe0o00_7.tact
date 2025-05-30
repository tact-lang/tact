struct DefaultsStruct {
    f1: Int = 1;
    f2: Bool = true;
    s: String = "hello";
}

contract DefaultVals {
    x: DefaultsStruct;

    init() {
        self.x = DefaultsStruct{};
    }
}