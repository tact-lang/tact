struct ManySerial {
    a: Int as uint8;
    b: Int as uint8;
    c: Int as uint8;
    d: Int as uint8;
    e: Int as uint8;
    f: Int as uint8;
    g: Int as uint8;
    h: Int as uint8;
    i: Int as uint8;
    j: Int as uint8;
}

contract ManySerials {
    s: ManySerial;

    init() {
        self.s = ManySerial{a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10};
    }
}