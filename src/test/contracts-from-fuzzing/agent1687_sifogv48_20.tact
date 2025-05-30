struct Big {
    a1: Int as int64;
    a2: Int as int128;
    a3: Int as uint256;
    b1: Bool;
    s1: String;
    s2: String?;
    b2: Bool?;
}

contract Test {
    data: Big;

    init() {
        self.data = Big{
            a1: -123456789,
            a2: -123456789123456789,
            a3: 123456789123456789123456789123456789,
            b1: true,
            s1: "hello",
            s2: null,
            b2: false
        };
    }
}