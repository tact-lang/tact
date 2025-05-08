struct SerialOpts {
    small: Int as uint4;
    big: Int as uint256;
    flag: Bool;
}

contract SerialOptsTest {
    val: SerialOpts;

    init() {
        self.val = SerialOpts{
            small: 7,
            big: 12345678901234567890,
            flag: false
        };
    }
}