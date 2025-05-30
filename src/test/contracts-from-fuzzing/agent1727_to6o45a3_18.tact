// contract with a giant number of fields to test storage layout
contract MassFields {
    f1: Int = 1; f2: Int = 2; f3: Int = 3; f4: Int = 4; f5: Int = 5;
    f6: Int = 6; f7: Int = 7; f8: Int = 8; f9: Int = 9; f10: Int = 10;
    f11: Bool = false; f12: Bool = true; f13: Bool = false; f14: Bool = true;
    f15: String = "a"; f16: String = "b"; f17: String = "c"; f18: String = "d";
    o1: Int?; o2: Int?; o3: Bool?; o4: Bool?; o5: String?; o6: String?;

    receive() {
        self.o1 = 99;
        self.o2 = null;
        self.o3 = false;
        self.o4 = null;
        self.o5 = "hi";
        self.o6 = null;
    }
}