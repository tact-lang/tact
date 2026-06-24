struct BigOne {
    a1: Int;
    a2: Bool;
    a3: String;
    a4: Int;
    a5: Bool;
    a6: String;
    a7: Int;
    a8: Bool;
    a9: String;
    a10: Int;
}

contract LargeFields {
    data: BigOne = BigOne{
        a1:1,a2:true,a3:"a",a4:2,a5:false,a6:"b",a7:3,a8:true,a9:"c",a10:4
    };

    init() {
        self.data = BigOne{
            a1:11,a2:false,a3:"aa",a4:22,a5:true,a6:"bb",a7:33,a8:false,a9:"cc",a10:44
        };
    }
}
