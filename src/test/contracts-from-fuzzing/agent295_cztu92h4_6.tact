// Contract with empty init() relying on default values, many optional fields
contract OptionalsDefaults {
    a: Int?;
    b: Bool?;
    c: Int?;
    d: Bool?;

    init() {}

    receive() {
        let _ = self.a;
        let _ = self.b;
        let _ = self.c;
        let _ = self.d;
    }
}