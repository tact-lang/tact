struct SerializeExtremes {
    posSmall: Int as uint1;
    negSmall: Int as int1;
    posBig: Int as uint256;
    negBig: Int as int257;
}

contract SerializeEdge {
    val: SerializeExtremes;
    init() {
        self.val = SerializeExtremes{
            posSmall:1,
            negSmall:0,
            posBig:115792089237316195423570985008687907853269984665640564039457584007913129639935,
            negBig:-57896044618658097711785492504343953926634992332820282019728792006155588075520,
        };
    }
}