struct SerFormats {
    a: Int as uint1;
    b: Int as uint7;
    c: Int as int9;
    d: Int as uint33;
    e: Int as int65;
    f: Int as uint128;
}

contract Test {
    s: SerFormats;
    init() {
        self.s = SerFormats{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}