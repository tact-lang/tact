struct Rec {
    x: Int;
}

contract ManyNullableVars {
    a: Int?;
    b: Bool?;
    c: Rec?;
    d: String?;
    e: Address?;

    init() {
        self.a = null;
        self.b = true;
        self.c = Rec{ x: 5 };
        self.d = null;
        self.e = null;
    }
}