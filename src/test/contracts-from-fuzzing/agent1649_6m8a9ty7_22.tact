struct BigInts {
    a: Int as int257;
    b: Int as uint256;
}

contract TestContract {
    data: BigInts;

    init() {
        self.data = BigInts{
            a: -1,
            b: 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF,
        };
    }
}