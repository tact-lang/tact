struct OneField { x: Int }

contract MultiNested {
    a: OneField;
    b: OneField?;
    c: Int;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = OneField{x:1};
        self.b = null;
        self.c = 5;
        self.d = true;
        self.e = "abc";
        self.f = null;
    }
}
