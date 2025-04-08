struct IntsSmall {
    i4: Int as uint4;
    i8: Int as int8;
    i12: Int as uint12;
    i20: Int as uint20;
    i32: Int as int32;
    i64: Int as uint64;
    i128: Int as int128;
    i256: Int as uint256;
}

contract VariousInts {
    val: IntsSmall;

    init() {
        self.val = IntsSmall{ i4:1, i8:1, i12:2, i20:3, i32:4, i64:5, i128:6, i256:7 };
    }
}