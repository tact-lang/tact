struct Wrap {
    big_int: Int as int257;
    small_uint: Int as uint8;
    med_int: Int as int64;
    big_uint: Int as uint128;
}

contract TestContract {
    w: Wrap = Wrap{big_int: -1, small_uint: 255, med_int: 123456789, big_uint: 123456789012345};

    init() {
        self.w = Wrap{big_int: 0, small_uint: 0, med_int: 0, big_uint: 0};
    }

    receive() {
        dump(self.w.small_uint);
    }
}