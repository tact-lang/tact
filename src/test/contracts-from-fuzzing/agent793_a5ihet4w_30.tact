struct S {
    largeNumber: Int as uint256;
    smallNumber: Int as uint8;
    normalInt: Int;
}

contract TestContract {
    store: S;

    init() {
        self.store = S{
            largeNumber: 123456789012345678901234567890,
            smallNumber: 255,
            normalInt: -1
        };
    }
    
    receive() {}
}