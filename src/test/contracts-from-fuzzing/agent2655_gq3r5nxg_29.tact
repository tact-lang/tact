struct Tiny {
    x: Int as uint8;
}

struct Medium {
    a: Int as int16;
    b: Int as uint32;
}

struct FullCombo {
    one: Tiny;
    two: Medium;
    val: Int as coins;
    name: String;
    flag: Bool;
}

contract SerialStructCombo {
    s: FullCombo;

    init() {
        self.s = FullCombo{
            one: Tiny{x:255},
            two: Medium{a:-32768,b:4294967295},
            val: ton("1"),
            name: "hi",
            flag: true
        };
    }
}