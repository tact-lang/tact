// Edge test: contract with a very long list of primitive fields of diverse types
contract MegaWide {
    a0: Int = 0;
    a1: Int = 1;
    a2: Int?;
    a3: Bool = false;
    a4: Bool?;
    a5: String = "0";
    a6: String?;
    a7: Int = 7;
    a8: Int?;
    a9: Bool = true;
    a10: Bool?;
    a11: String = "11";
    a12: String?;

    init() {
        self.a2 = 2;
        self.a4 = true;
        self.a6 = "6";
        self.a8 = 8;
        self.a10 = false;
        self.a12 = "12";
    }

    receive() {}
}