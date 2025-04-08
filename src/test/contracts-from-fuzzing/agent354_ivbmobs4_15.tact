struct BigInts {
    a: Int as int257;
    b: Int as uint256;
}

contract BigIntsTest {
    data: BigInts;

    init() {
        self.data = BigInts{
            a: -1,
            b: 1000000
        };
    }
}