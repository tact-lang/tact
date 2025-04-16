struct Rec { a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?; }

contract MixedInline {
    rec: Rec;

    init() {
        self.rec = Rec{
            a: 1,
            b: false,
            c: "text",
            d: null,
            e: null,
            f: "nullable"
        };
    }
}