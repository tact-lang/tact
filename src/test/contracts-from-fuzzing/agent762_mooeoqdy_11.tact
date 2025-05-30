struct Packed1 { a: Int as uint8; b: Int as uint8; c: Int as uint8; }

contract TestContract {
    compact: Packed1;
    init() {
        self.compact = Packed1{a:1, b:2, c:3};
    }
    receive() {
        self.compact = self.compact;
    }
}