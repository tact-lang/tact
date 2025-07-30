struct Alternating {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract AltFields {
    val: Alternating;

    init() {
        self.val = Alternating{ a: 2, b: true, c: null, d: false };
    }
}