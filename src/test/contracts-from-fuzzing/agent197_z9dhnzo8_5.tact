// Test multiple optional primitive fields with default = null
contract ManyOptionals {
    a: Int?;  // null
    b: Bool?; // null
    c: String?; // null
    d: Cell?; // null
    e: Address?; // null

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = emptyCell();
        self.e = myAddress();
    }
}