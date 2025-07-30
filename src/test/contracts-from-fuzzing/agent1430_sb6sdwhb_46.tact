struct BitPacked {
    a: Int as uint1;
    b: Bool;
    c: Int as uint2;
    d: Int as uint3;
    e: Int as uint4;
}

contract BitPackedC {
    s: BitPacked;

    init() {
        self.s = BitPacked{
            a:1,b:true,c:2,d:4,e:8
        };
    }
}
