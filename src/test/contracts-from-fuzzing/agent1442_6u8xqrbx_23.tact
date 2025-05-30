// edge: flat persistent state with multiple strings and optionals
contract TestContract {
    a: String;
    b: String?;
    c: String;
    d: String?;
    init() {
        self.a = "a";
        self.b = null;
        self.c = "c";
        self.d = null;
    }
}