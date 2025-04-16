struct DefStruct {
    x: Int = 5;
    y: Bool = false;
}

contract PersistentDefaults {
    data: DefStruct;

    init() {
        self.data = DefStruct{};
    }
}