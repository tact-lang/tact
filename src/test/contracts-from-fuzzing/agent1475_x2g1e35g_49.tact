// Differing ordering with int/bool/string
contract ShuffleOrder {
    s: String;
    b: Bool;
    i: Int;

    init() {
        self.s = "a";
        self.b = false;
        self.i = 42;
    }
}