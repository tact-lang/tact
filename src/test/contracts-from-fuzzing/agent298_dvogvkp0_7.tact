struct Numbers {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as int64;
    f: Int as int257;
}

contract SerializeTest {
    nums: Numbers;
    init() {
        self.nums = Numbers{
            a:1,b:2,c:3,d:4,e:5,f:6
        };
    }
}