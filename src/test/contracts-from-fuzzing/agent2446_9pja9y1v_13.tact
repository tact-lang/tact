struct SDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
}

contract MixDefaults {
    f1: Int = 123;
    f2: Bool;
    f3: String;
    nest: SDefaults;

    init() {
        self.f2 = false;
        self.f3 = "zzz";
        self.nest = SDefaults{};
    }
}