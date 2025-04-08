struct SStr {
    s: String;
}

contract InitOrderTest {
    x: Int;
    s: SStr;
    b: Bool;

    init() {
        self.x = 5;
        self.s = SStr{s:"text"};
        self.b = true;
    }
}