struct Bitfield {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
    d: Int as uint1;
    e: Int as uint1;
    f: Int as uint1;
    g: Int as uint1;
    h: Int as uint1;
    i: Int as uint1;
}

contract TestContract {
    bits: Bitfield;

    init() {
        self.bits = Bitfield{
            a:1,b:0,c:1,d:0,e:1,f:0,g:1,h:0,i:1
        };
    }
}