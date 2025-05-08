struct Combo {
    s: String;
    b: Bool;
    i: Int;
}

contract ManyFields {
    s1: String;
    b1: Bool;
    i1: Int;
    cs: Combo;

    init() {
        self.s1 = "hi";
        self.b1 = true;
        self.i1 = 123;
        self.cs = Combo{ s: "x", b: false, i: 7 };
    }
}