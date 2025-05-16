struct Elephant {
    hugeNumber: Int as uint256;
    smallFlag: Bool;
    note: String;
}

contract TestContract {
    e: Elephant;

    init() {
        self.e = Elephant{
            hugeNumber: 123456789123456789123456789123456789,
            smallFlag: true,
            note: "Hi"
        };
    }
}