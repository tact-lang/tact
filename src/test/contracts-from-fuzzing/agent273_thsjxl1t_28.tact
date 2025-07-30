struct Variant {
    a: Int?;
    b: Int;
    c: Int?;
    d: Int;
}

contract Test28 {
    v: Variant;

    init() {
        self.v = Variant{ a:null, b:1, c:null, d:2 };
    }
}