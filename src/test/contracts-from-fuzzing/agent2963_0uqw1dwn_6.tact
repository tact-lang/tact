struct LargeStruct {
    a0: Int;
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    s0: String;
    s1: String;
    s2: String;
    s3: String;
    b0: Bool;
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract LargeStructStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a0: 0,a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,
            s0: "s0", s1:"s1", s2:"s2", s3:"s3",
            b0:true,b1:false,b2:true,b3:false
        };
    }
}
