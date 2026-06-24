contract LongContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: Int;
    field6: Bool;
    field7: Address;
    field8: String;
    field9: Int;
    field10: Bool;
    field11: Address;
    field12: String;
    field13: Int;
    field14: Bool;
    field15: Address;
    field16: String;
    field17: Int;
    field18: Bool;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = "one";
        self.field5 = 2;
        self.field6 = false;
        self.field7 = myAddress();
        self.field8 = "two";
        self.field9 = 3;
        self.field10 = true;
        self.field11 = myAddress();
        self.field12 = "three";
        self.field13 = 4;
        self.field14 = false;
        self.field15 = myAddress();
        self.field16 = "four";
        self.field17 = 5;
        self.field18 = true;
    }
}