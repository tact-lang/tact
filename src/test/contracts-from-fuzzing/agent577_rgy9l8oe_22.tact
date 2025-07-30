struct Combo {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String?;
}

contract TestContract {
    comb: Combo;

    init() {
        self.comb = Combo{
            a: 1, b: false, c: null, d: true, e: "z", f: null
        };
    }
}