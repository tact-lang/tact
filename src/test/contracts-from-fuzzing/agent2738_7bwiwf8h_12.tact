struct DeepWide {
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

    s1: Sub;
    s2: Sub;
    s3: Sub;
    s4: Sub;
}

struct Sub {
    x: Int;
    b: Bool;
    str: String;
    addr: Address;
}

contract BigNested {
    field: DeepWide;

    init() {
        self.field = DeepWide{
            a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10,
            s1: Sub{x:11,b:true,str:"hi",addr:myAddress()},
            s2: Sub{x:12,b:false,str:"yo",addr:myAddress()},
            s3: Sub{x:13,b:true,str:"ok",addr:myAddress()},
            s4: Sub{x:14,b:false,str:"hm",addr:myAddress()}
        };
    }
}
