struct MixOptDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixOptDefTest {
    m: MixOptDefaults;

    init() {
        self.m = MixOptDefaults{ d: null, e: null, f: null };
    }
}