contract MixedLiteralsStructsOptionals {
    a: Int;
    b: Bool?;
    c: String;
    d: Address?;
    init() {
        self.a = 5;
        self.b = null;
        self.c = "somestring";
        self.d = null;
    }
}