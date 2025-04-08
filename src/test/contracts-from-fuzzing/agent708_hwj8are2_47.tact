struct BigInts {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
}

contract SerializedInts {
    val: BigInts;
    init() {
        self.val = BigInts{ a:1,b:-2,c:3,d:-4,e:5 };
    }
}