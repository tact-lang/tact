struct Mixed {
    a: Int;
    b: Bool?;
    c: String?;
    d: String;
    e: Bool;
}

contract MixedComp {
    stuff: Mixed;

    init() {
        self.stuff = Mixed{
            a: 1,
            b: null,
            c: null,
            d: "hey",
            e: false,
        };
    }
}