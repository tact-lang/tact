message((crc32("Tact") + 42) & 0xFFFF_FFFF) MsgExpr {
    foo: Int;
}

contract MsgExprStore {
    m: MsgExpr;

    init() {
        self.m = MsgExpr{ foo: 1 };
    }
}