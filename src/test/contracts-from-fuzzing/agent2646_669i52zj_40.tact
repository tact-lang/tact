struct Sizing {
    a: Int as uint64;
    b: Int as uint32;
    c: Int as uint16;
    d: Int as uint8;
    e: Int as uint4;
}

contract ContractSizes {
    s: Sizing;
    init() {
        self.s = Sizing{a:1,b:2,c:3,d:4,e:5};
    }
    receive() {}
}