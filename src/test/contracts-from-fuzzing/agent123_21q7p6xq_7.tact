struct A { f1: Int as uint8; f2: Int as uint256; f3: Int as int64; f4: Bool; f5: String; f6: Address; }

contract TestContract {
    data: A;

    init() {
        self.data = A{
            f1: 5,
            f2: 1000000000000,
            f3: -12345678,
            f4: true,
            f5: "hello",
            f6: myAddress()
        };
    }
}