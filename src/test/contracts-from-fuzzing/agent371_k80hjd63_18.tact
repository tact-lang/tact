struct LargeNumbers {
    a: Int as uint4;
    b: Int as int4;
    c: Int as uint8;
    d: Int as int8;
    e: Int as uint16;
    f: Int as int16;
    g: Int as uint32;
    h: Int as int32;
    i: Int as uint64;
    j: Int as int64;
}

contract TestContract {
    nums: LargeNumbers;
    init() {
        self.nums = LargeNumbers{
            a:1, b:-1, c:2, d:-2, e:3, f:-3, g:4, h:-4, i:5, j:-5
        };
    }
}