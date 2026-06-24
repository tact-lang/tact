struct SColor {
    name: String;
    code: Int as uint24;
}

contract ColorsList {
    c1: SColor;
    c2: SColor;

    init() {
        self.c1 = SColor{name: "red", code: 0xFF0000};
        self.c2 = SColor{name: "green", code: 0x00FF00};
    }
}
