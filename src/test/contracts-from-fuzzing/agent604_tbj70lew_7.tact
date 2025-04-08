struct Child {
    field1: Int;
    field2: Int;
    field3: Int;
    field4: Int;
    field5: Int;
    field6: Int;
    field7: Int;
    field8: Int;
    field9: Int;
    field10: Int;
}

contract LotsOfFields {
    c1: Child;
    c2: Child;
    c3: Child;
    c4: Child;
    c5: Child;
    c6: Child;
    c7: Child;
    c8: Child;
    c9: Child;
    c10: Child;

    init() {
        self.c1 = Child{field1:1,field2:1,field3:1,field4:1,field5:1,field6:1,field7:1,field8:1,field9:1,field10:1};
        self.c2 = self.c1;
        self.c3 = self.c1;
        self.c4 = self.c1;
        self.c5 = self.c1;
        self.c6 = self.c1;
        self.c7 = self.c1;
        self.c8 = self.c1;
        self.c9 = self.c1;
        self.c10 = self.c1;
    }

    receive() {
        let _ = self.c5.field5;
    }
}