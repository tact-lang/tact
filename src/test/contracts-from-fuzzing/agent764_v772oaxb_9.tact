struct Stringy {
    s1: String;
    s2: String?;
}

struct Booly {
    b1: Bool;
    b2: Bool?;
}

contract MixedStringsBools {
    st: Stringy;
    bl: Booly;

    init() {
        self.st = Stringy{ s1: "hello", s2: null };
        self.bl = Booly{ b1: true, b2: null };
    }
}