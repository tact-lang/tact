// optional string, address, bool with null as initial value
contract Test {
    s: String?;
    a: Address?;
    b: Bool?;

    init() {
        self.s = null;
        self.a = null;
        self.b = null;
    }
}