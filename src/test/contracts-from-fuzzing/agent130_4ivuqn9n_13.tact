struct Packed {
    a: Int as uint1;
    b: Int as uint1;
    c: Int as uint1;
    d: Int as uint1;
    e: Int as uint1;
    f: Int as uint1;
    g: Int as uint1;
    h: Int as uint1;
}

contract BitPacking {
    p: Packed = Packed{
        a:0,b:1,c:0,d:1,e:0,f:1,g:0,h:1
    };
    receive() {
        self.p = self.p;
    }
}