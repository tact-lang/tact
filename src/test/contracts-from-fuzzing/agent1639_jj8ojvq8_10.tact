struct DefaultStruct {
    x: Int = 5;
    y: Bool = true;
    z: String = "zzz";
}

contract DefaultInStruct {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}
