// Weird ordering of types
contract Ordering {
    s: String?;
    b: Bool;
    i: Int?;

    init() {
        self.s = null;
        self.b = true;
        self.i = 100;
    }
}