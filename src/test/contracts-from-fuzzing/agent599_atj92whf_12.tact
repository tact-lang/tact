struct DefaultsStruct {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaults {
    myfield: DefaultsStruct;
    init() {
        self.myfield = DefaultsStruct{};
    }
}