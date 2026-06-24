struct DeepScalars {
    a: Int;
    b: Int as uint8;
    c: Int as uint32;
    d: Int;
    e: Bool;
    f: String;
    g: String;
    h: Bool;
    i: Int as int64;
    j: Int;
}

contract DeepScalarsContract {
    ds: DeepScalars;
    init() {
        self.ds = DeepScalars{ a:1,b:2,c:3,d:4,e:true,f:"abc",g:"xyz",h:false,i:5,j:6 };
    }
}