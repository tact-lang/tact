struct S1 { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }

contract ComplexNested {
    field: S1;
    init() {
        self.field = S1{
            a: 1,
            b: true,
            c: "hi",
            d: null,
            e: null,
            f: null
        };
    }
}