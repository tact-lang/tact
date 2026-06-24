struct ManyBool {
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

contract ManyBoolContract {
    s: ManyBool;

    init() {
        self.s = ManyBool{
            b1:true, b2:true, b3:false, b4:true, b5:false,
            b6:true, b7:true, b8:false, b9:true, b10:false
        };
    }
}