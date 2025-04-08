struct S {
    a: Int as uint8;
    b: Int as uint256;
}

contract SerializeFields {
    d: S;

    init() {
        self.d = S{
            a: 255,
            b: 123456789,
        };
    }
}
