struct BigNester {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    x9: Int;
    x10: Int;
    y1: Bool;
    y2: Bool;
    y3: Bool;
    y4: Bool;
    y5: Bool;
    str1: String;
    str2: String;
    str3: String;
    opt1: Int?;
    opt2: String?;
    inner: Inner;
}

struct Inner {
    a: Int;
    b: Bool;
    s: String;
    o: Int?;
}

contract Test {
    data: BigNester;

    init() {
        self.data = BigNester{
            x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10,
            y1:true,y2:false,y3:true,y4:false,y5:true,
            str1:"a",str2:"b",str3:"c",
            opt1:null,
            opt2:null,
            inner: Inner{a:42,b:true,s:"s",o:null}
        };
    }
}