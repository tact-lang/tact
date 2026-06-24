struct Serials {
    a: Int as uint1;
    b: Int as uint16;
    c: Int as int32;
    d: Int as int64;
    e: Int as coins;
}

contract MixedSerials {
    s: Serials;

    init() {
        self.s = Serials{ a:1,b:100,c:-33,d:-4000,e:ton("1") };
    }
}