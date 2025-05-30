// Contract with mixed explicit and default-initialized fields
contract DefaultsMix {
    a: Int = 10;
    b: Bool;
    c: String = "hello";
    d: Address;

    init() {
        self.b = true;
        self.d = myAddress();
    }
}