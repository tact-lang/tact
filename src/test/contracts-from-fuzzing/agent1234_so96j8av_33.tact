struct BigInts {
    a: Int as uint256;
    b: Int as int257;
}

contract BigIntTest {
    data: BigInts;

    init() {
        self.data = BigInts{
            a: 57896044618658097711785492504343953926634992332820282019728792003956564819968,
            b: -115792089237316195423570985008687907853269984665640564039457584007913129639935,
        };
    }
}