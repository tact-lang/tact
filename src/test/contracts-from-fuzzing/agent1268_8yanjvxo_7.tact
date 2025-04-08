struct WithSerialization {
    id: Int as uint32;
    flag: Bool;
    amount: Int as coins;
    status: Int as int8;
    hash: Int as uint256;
}

contract TestContract {
    s: WithSerialization;

    init() {
        self.s = WithSerialization{
            id: 42,
            flag: true,
            amount: ton("2"),
            status: -5,
            hash: 12345
        };
    }
}