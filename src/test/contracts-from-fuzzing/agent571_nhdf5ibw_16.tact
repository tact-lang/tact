struct Large {
    a: Int as int257;
    b: Int as uint256;
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{a: -123456789, b: 987654321};
    }
}