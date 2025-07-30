struct ManyBooleans {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
    b9: Bool;
    b10: Bool;
}

contract BooleansPackedTest {
    f: ManyBooleans;

    init() {
        self.f = ManyBooleans{
            b1:true, b2:false, b3:true, b4:false, b5:true,
            b6:true, b7:false, b8:true, b9:false, b10:true
        };
    }
}