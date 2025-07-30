struct Nested {
    s1: String;
    s2: String;
}

contract ManyVars {
    field1: Int;
    field2: Bool;
    field3: Nested;
    field4: Int;
    field5: String;
    field6: Bool;
    field7: String;
    field8: Int?;
    field9: String?;
    field10: Bool;

    init() {
        self.field1 = 0;
        self.field2 = true;
        self.field3 = Nested{ s1: "hi", s2: "bye" };
        self.field4 = 4;
        self.field5 = "xyz";
        self.field6 = false;
        self.field7 = "more";
        self.field8 = null;
        self.field9 = null;
        self.field10 = false;
    }
}
