contract LargeStorage {
    a1: Int = 1;
    a2: Int = 2;
    a3: Int = 3;
    a4: Int = 4;
    a5: Int = 5;
    b1: Bool = true;
    b2: Bool = false;
    b3: Bool = true;
    b4: Bool = false;
    b5: Bool = true;
    c1: Address;
    c2: Address;
    c3: Address;
    c4: Address;
    c5: Address;
    d1: String = "1";
    d2: String = "2";
    d3: String = "3";
    d4: String = "4";
    d5: String = "5";
    e1: Int as uint8 = 1;
    e2: Int as uint8 = 2;
    e3: Int as uint8 = 3;
    e4: Int as uint8 = 4;
    e5: Int as uint8 = 5;

    init() {
        self.c1 = myAddress();
        self.c2 = myAddress();
        self.c3 = myAddress();
        self.c4 = myAddress();
        self.c5 = myAddress();
    }

    receive() {
        self.a1 += 1;
    }
}
