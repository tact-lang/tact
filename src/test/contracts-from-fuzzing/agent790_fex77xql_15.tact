struct Many {
    f1: Int as int8;
    f2: Int as int16;
    f3: Int as uint8;
    f4: Int as uint16;
    f5: Int as int32;
    f6: Int as uint32;
    f7: Bool;
    f8: String;
    f9: String?;
}

contract Serializations {
    s: Many;

    init() {
        self.s = Many{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:true,f8:"x",f9:null
        };
    }
}