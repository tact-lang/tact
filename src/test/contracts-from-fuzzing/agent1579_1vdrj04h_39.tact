contract ContractWithStructsAndStrings {
    s: String;
    o: String?;
    b: Bool;
    nb: Bool?;
    i: Int;
    ni: Int?;

    init() {
        self.s = "abc";
        self.o = null;
        self.b = true;
        self.nb = null;
        self.i = 123;
        self.ni = null;
    }
}