// Persistent state with only optionals with values
contract OptionalsSet {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "hi";
    }
}