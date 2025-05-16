struct DefStruct {
    a: Int = 1;
    b: Bool = false;
    s: String = "hello";
}

contract StructDefaults {
    field: DefStruct;

    init() {
        self.field = DefStruct{};
    }
}