struct Wide {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Bool;
    f12: Bool?;
    f13: String;
    f14: String;
}

contract TestContract {
    data: Wide;

    init() {
        self.data = Wide{
            f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
            f11:true,f12:null,f13:"hello",f14:"world"
        };
    }
}