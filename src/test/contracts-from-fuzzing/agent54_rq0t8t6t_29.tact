struct NestedExtreme {
    ext: ExtremeNested;
}

struct ExtremeNested {
    small: Int as int1;
    big: Int as int257;
    usmall: Int as uint1;
    ubig: Int as uint256;
}

contract NestedExtremeSerialization {
    val: NestedExtreme;

    init() {
        self.val = NestedExtreme{
            ext: ExtremeNested{
                small: 0,
                big: -1,
                usmall: 1,
                ubig: 2
            }
        };
    }
}