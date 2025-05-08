// test optional string, address, bool with non-null initial value
contract Test {
    s: String?;
    a: Address?;
    b: Bool?;

    init() {
        self.s = "hello";
        self.a = myAddress();
        self.b = true;
    }
}