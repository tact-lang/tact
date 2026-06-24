struct Many {
    x1: Int;
    x2: Int;
    x3: Int;
    x4: Int;
    x5: Int;
    x6: Int;
    x7: Int;
    x8: Int;
    y1: Bool;
    y2: Bool;
    y3: Bool;
    y4: Bool;
    y5: Bool;
    z1: String;
    z2: String;
    z3: String;
    w: Address;
}

contract BigStructFields {
    s: Many;

    init() {
        self.s = Many{
            x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,
            y1:true,y2:false,y3:true,y4:false,y5:true,
            z1:"a",z2:"b",z3:"c",
            w: myAddress()
        };
    }
}