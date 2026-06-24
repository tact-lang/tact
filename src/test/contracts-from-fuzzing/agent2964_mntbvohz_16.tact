struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract LargeContract {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int?;
    f5: Bool?;
    f6: String?;
    s: S;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "x";
        self.f4 = null;
        self.f5 = null;
        self.f6 = null;
        self.s = S{
            a: 2,
            b: false,
            c: "y"
        };
    }
}