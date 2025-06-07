// default storage values with literal Address expression
contract DefaultsInFieldsFixed {
    a: Int = 10;
    b: Bool = true;
    c: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    d: String = "def";
    init() {
        self.a = 20;
        self.b = false;
        self.c = myAddress();
        self.d = "changed";
    }
}