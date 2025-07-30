struct S {
    large: Int as uint128;
    small: Int as uint8;
}

contract TestContract {
    s: S;

    init() {
        self.s = S{
            large: 123456789,
            small: 12,
        };
    }
}
