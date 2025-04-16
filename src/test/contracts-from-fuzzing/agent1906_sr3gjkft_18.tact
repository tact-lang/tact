struct WithBigInt {
    bigint: Int as int257;
    smallint: Int as int8;
}

contract SerializeTest {
    data: WithBigInt;

    init() {
        self.data = WithBigInt{ bigint: 100, smallint: 5 };
    }
}
