struct MinInts {
    tiny: Int as int1;
    huge: Int as int257;
}

contract SerializationNegEdges {
    data: MinInts;

    init() {
        self.data = MinInts{
            tiny: -1,
            huge: -115792089237316195423570985008687907853269984665640564039457584007913129639936,
        };
    }
}