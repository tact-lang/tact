message((crc32("Tact") + 42) & 0xFFFF_FFFF) TestMsgExpr {
    value: Int as uint4;
}

contract TestMsgExprContract() {
    // A dummy receiver to ensure that message TestMsgExpr is compiled and used
    // In practice, the receiver simply dumps the field and performs a cashback
    receive(msg: TestMsgExpr) {
        dump(msg.value);
        cashback(sender());
    }
}
