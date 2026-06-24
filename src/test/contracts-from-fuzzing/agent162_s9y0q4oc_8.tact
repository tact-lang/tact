struct A {
    x: Int as uint8;
    y: Int as int64;
    z: Int as uint256;
}

contract TestContract {
    data: A;

    init() {
        self.data = A{
            x: 255,
            y: -123456,
            z: 123456789
        };
    }
}