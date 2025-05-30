struct ManyFields {
    a1: Int;
    a2: Bool;
    a3: Int;
    a4: Bool;
    a5: Int;
    a6: Bool;
    a7: Int;
    a8: Bool;
    a9: Int;
    a10: Bool;
    a11: Int;
    a12: Bool;
    a13: Int;
    a14: Bool;
    a15: Int;
    a16: Bool;
    a17: Int;
    a18: Bool;
    a19: Int;
    a20: Bool;
}

contract TestContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a1: 1,a2:true,a3:2,a4:false,a5:3,a6:true,a7:4,a8:false,a9:5,a10:true,
            a11:6,a12:false,a13:7,a14:true,a15:8,a16:false,a17:9,a18:true,a19:10,a20:false
        };
    }
}