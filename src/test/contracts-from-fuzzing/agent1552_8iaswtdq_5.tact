struct ABC {
    a: Int;
    b: Bool?;
    c: String;
}

contract LongList {
    x1: Int;
    x2: Bool;
    x3: String;
    x4: Int?;
    x5: String;
    x6: Bool?;
    x7: Int;
    x8: Bool;
    x9: String;
    x10: Int?;
    complex: ABC;

    init() {
        self.x1 = 1;
        self.x2 = true;
        self.x3 = "3";
        self.x4 = null;
        self.x5 = "5";
        self.x6 = false;
        self.x7 = 7;
        self.x8 = true;
        self.x9 = "9";
        self.x10 = null;
        self.complex = ABC{a: 42, b: null, c: "str"};
    }
}