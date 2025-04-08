struct X {
    a: Int?;
    b: Bool?;
}

contract MixDefaults {
    f1: Int = 1;
    s: X = X{ a: null, b: null };
    f2: Bool = false;
    f3: String = "abc";

    init() {
        self.f1 = 100;
        self.s = X{ a: 42, b: true };
        self.f2 = true;
        self.f3 = "xyz";
    }
}