struct Widths {
    s1: Int as int4;
    u1: Int as uint4;
    s2: Int as int16;
    u2: Int as uint16;
    s3: Int as int64;
    u3: Int as uint64;
    s4: Int as int257;
    u4: Int as uint256;
}

contract Test22 {
    data: Widths;

    init() {
        self.data = Widths{
            s1: 3, u1: 4, s2: -2, u2: 5,
            s3: -123456, u3: 123456, s4: -1, u4: 1
        };
    }
}
