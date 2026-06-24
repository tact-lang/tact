struct SerializedBits {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int257;
    d: Int as uint256;
    flag: Bool;
}

contract TestContract {
    data: SerializedBits;

    init() {
        self.data = SerializedBits{
            a: -1,
            b: 1,
            c: -123456789,
            d: 123456789,
            flag: true,
        };
    }
}