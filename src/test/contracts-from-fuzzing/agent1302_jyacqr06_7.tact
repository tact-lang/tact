struct LargeStruct {
    a1: Int as uint1;
    a2: Int as uint2;
    a3: Int as uint3;
    a4: Int as uint4;
    a5: Int as uint5;
    a6: Int as uint6;
    a7: Int as uint7;
    a8: Int as uint8;
    a9: Int as uint9;
    a10: Int as uint10;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    s1: String;
    s2: String;
    optI: Int?;
    optB: Bool?;
}

contract ManyFields {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            b1:true,b2:false,b3:true,b4:false,
            s1: "first string",
            s2: "second string",
            optI: 42,
            optB: null
        };
    }

    receive() {
        let f = self.data.a10;
        let s = self.data.s2;
    }
}
