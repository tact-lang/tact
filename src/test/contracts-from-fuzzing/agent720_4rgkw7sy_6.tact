struct LargeStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Bool = true;
    e: Bool = false;
    f: Int = 4;
    g: String = "g";
    h: String = "h";
    i: Int = 5;
    j: Bool = true;
}

contract BigFields {
    storage: LargeStruct;

    init() {
        self.storage = LargeStruct{};
    }
}