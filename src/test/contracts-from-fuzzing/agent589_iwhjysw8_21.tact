// Test persistent record with large number (30+) of mixed explicit fields
contract ManyFields {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    s5: String;
    o1: Int?;
    o2: Int?;
    o3: String?;
    o4: String?;
    o5: Bool?;
    o6: Bool?;
    o7: Int?;
    o8: String?;
    o9: Bool?;
    o10: Bool?;

    init() {
        self.a1 = 1; self.a2 = 2; self.a3 = 3; self.a4 = 4; self.a5 = 5;
        self.a6 = 6; self.a7 = 7; self.a8 = 8; self.a9 = 9; self.a10 = 10;
        self.b1 = true; self.b2 = false; self.b3 = true; self.b4 = false; self.b5 = true;
        self.s1 = "a"; self.s2 = "b"; self.s3 = "c"; self.s4 = "d"; self.s5 = "e";
        self.o1 = null; self.o2 = null; self.o3 = null; self.o4 = null; self.o5 = null;
        self.o6 = null; self.o7 = null; self.o8 = null; self.o9 = null; self.o10 = null;
    }
}
