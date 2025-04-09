struct BitField {
    f1: Int as uint1;
    f2: Int as uint1;
    f3: Int as uint1;
    f4: Int as uint1;
    f5: Int as uint1;
    f6: Int as uint1;
    f7: Int as uint1;
    f8: Int as uint1;
}

contract TestContract {
    b: BitField;
    init() {
        self.b = BitField{f1:0,f2:1,f3:0,f4:1,f5:0,f6:1,f7:0,f8:1};
    }
}