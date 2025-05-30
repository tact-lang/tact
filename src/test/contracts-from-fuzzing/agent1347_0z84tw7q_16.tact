struct SerializedInts {
    a: Int as uint1;
    b: Int as uint4;
    c: Int as uint8;
    d: Int as uint16;
    e: Int as uint32;
    f: Int as uint64;
    g: Int as uint128;
    h: Int as uint256;
}

contract TestContract {
    data: SerializedInts;

    init() {
        self.data = SerializedInts{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8
        };
    }
}