// contract with only string persistent fields
contract JustStrings {
    a: String;
    b: String?;
    c: String = "hello";
    d: String? = null;

    init() {
        self.a = "A";
        self.b = null;
        self.c = "C";
        self.d = "D";
    }
}