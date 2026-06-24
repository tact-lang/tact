struct Bits {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as uint32;
    f: Int as uint64;
}

contract DifferentIntWidths {
    bits: Bits;

    init() {
        self.bits = Bits{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }

    receive() {
        let b = self.bits;
    }
}