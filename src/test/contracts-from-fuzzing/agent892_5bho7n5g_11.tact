struct Rec {
    a: Int;
    b: Int?;
    c: String;
    d: Bool;
}

contract OptDefaults {
    rec1: Rec?;
    rec2: Rec?;

    init() {
        self.rec1 = null;
        self.rec2 = Rec {
            a: 5,
            b: null,
            c: "hello",
            d: true
        };
    }
}