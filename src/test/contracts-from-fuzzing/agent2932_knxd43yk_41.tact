struct DefaultStruct {
    x: Int = 1;
    y: Bool = true;
    z: String = "x";
}

contract EmbeddedDefaults {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}