struct SpecialSerialization {
    amount: Int as coins;
    small: Int as uint4;
    big: Int as int257;
}

contract SpecialSerTest {
    data: SpecialSerialization;

    init() {
        self.data = SpecialSerialization{
            amount: ton("2"),
            small: 9,
            big: -42
        };
    }
}