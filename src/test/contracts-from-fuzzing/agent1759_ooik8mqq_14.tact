struct SNested {
    x: Int;
}

contract ManyFields {
    a1: Int;
    a2: Bool;
    a3: Int?;
    a4: Bool?;
    a5: String;
    a6: String?;
    a7: Int;
    a8: Bool;
    a9: SNested;
    a10: Int?;

    init() {
        self.a1 = 1;
        self.a2 = true;
        self.a3 = null;
        self.a4 = false;
        self.a5 = "x";
        self.a6 = null;
        self.a7 = 7;
        self.a8 = true;
        self.a9 = SNested{ x:10 };
        self.a10 = 100;
    }
}
