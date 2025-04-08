struct ManyFields {
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
    a11: Bool;
    a12: Bool;
    a13: Bool;
    a14: Bool;
    a15: Bool;
    a16: Bool;
    a17: String;
    a18: String;
    a19: String;
    a20: String;
}

contract ManyPersistentFields {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            a11:true,a12:false,a13:true,a14:false,a15:true,a16:false,
            a17:"a",a18:"b",a19:"c",a20:"d"
        };
    }
}