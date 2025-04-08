struct Combo {
    a: Int as uint8;
    b: Int?;
    c: String;
    d: Bool?;
}

contract MixedSerialization {
    s: Combo;

    init() {
        self.s = Combo{
            a:255, b:null, c:"hi", d:null
        };
    }
}