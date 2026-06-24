struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract ComboStorage {
    field: Combo;

    init() {
        self.field = Combo {
            a: 1, b: null, c: true, d: null, e: "ok", f: null
        };
    }
}