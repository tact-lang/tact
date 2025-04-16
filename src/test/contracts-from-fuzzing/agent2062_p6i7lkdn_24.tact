struct PrimAndOpt {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract PersistentMixed {
    field: PrimAndOpt;
    init() {
        self.field = PrimAndOpt{
            a: 1, b: true, c: "hi",
            d: null, e: null, f: null,
        };
    }
}