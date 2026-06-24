// Struct with many primitive fields and optionals interleaved
struct Combo {
    a: Int; b: Bool; c: Int?; d: Bool?;
    e: Address; f: String?; g: Cell; h: String;
}

contract ComboFields {
    store: Combo;

    init() {
        self.store = Combo {
            a:1, b:true, c:null, d:false,
            e: myAddress(), f: null, g: emptyCell(), h: "hi"
        };
    }
}
