// test empty string assignment to persistent storage
contract Test {
    s: String = "Hello";
    optionalS: String? = null;

    init() {
        self.s = "";
        self.optionalS = "";
    }
}