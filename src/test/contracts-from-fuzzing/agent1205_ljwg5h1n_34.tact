struct DefaultsStruct {
    i: Int = 0;
    b: Bool = false;
    s: String = "";
}

contract TestContract {
    defStruct: DefaultsStruct;
    init() {
        self.defStruct = DefaultsStruct{};
    }
}