struct Slot {
    field1: Int;
    field2: Bool?;
}

contract ArraySim {
    s1: Slot;
    s2: Slot;
    s3: Slot;
    s4: Slot;
    s5: Slot;
    s6: Slot;
    s7: Slot;
    s8: Slot;
    s9: Slot;
    s10: Slot;

    init() {
        self.s1 = Slot{ field1:1, field2:true };
        self.s2 = Slot{ field1:2, field2:false };
        self.s3 = Slot{ field1:3, field2:null };
        self.s4 = Slot{ field1:4, field2:true };
        self.s5 = Slot{ field1:5, field2:null };
        self.s6 = Slot{ field1:6, field2:false };
        self.s7 = Slot{ field1:7, field2:true };
        self.s8 = Slot{ field1:8, field2:null };
        self.s9 = Slot{ field1:9, field2:false };
        self.s10= Slot{ field1:10, field2:true };
    }
}