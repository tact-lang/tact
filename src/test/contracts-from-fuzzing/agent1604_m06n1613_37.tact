struct S1 {
    a: Int?;
    b: Int = 5;
    c: Bool?;
    d: Bool = false;
}

contract MixedOptionalDefaults {
    s: S1;

    init() {
        self.s = S1{ a:null, c:null };
    }

    receive() {}
}