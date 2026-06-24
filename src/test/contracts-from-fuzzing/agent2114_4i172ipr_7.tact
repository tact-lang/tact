struct BigVals {
    i8: Int as int8;
    u8: Int as uint8;
    i256: Int as int256;
    u256: Int as uint256;
    boolTrue: Bool;
    boolFalse: Bool;
}

contract SerializationEdge {
    data: BigVals;
    
    init() {
        self.data = BigVals{
            i8: -128,
            u8: 255,
            i256: -1,
            u256: 115792089237316195423570985008687907853269984665640564039457584007913129639935,
            boolTrue: true,
            boolFalse: false,
        };
    }
}
