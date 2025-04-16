struct ManySizes {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as int64;
    d: Int as uint128;
    e: Int as int257;
    f: Int as uint256;
}

contract TestContract {
    nums: ManySizes = ManySizes{
        a: 1,
        b: 2,
        c: 3,
        d: 4,
        e: 5,
        f: 6,
    };

    receive() {
        self.nums = ManySizes{
            a: 0,
            b: 255,
            c: -42,
            d: 123456789,
            e: -5,
            f: 9999999999,
        };
    }
}
