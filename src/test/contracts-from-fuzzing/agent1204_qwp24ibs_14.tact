// Contract with varied string and string optionals
contract StringsGalore {
    a: String;
    b: String?;
    c: String;
    d: String?;
    e: String;
    f: String?;

    init() {
        self.a = "abc";
        self.b = null;
        self.c = "def";
        self.d = null;
        self.e = "ghi";
        self.f = null;
    }
}