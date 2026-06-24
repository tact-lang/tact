// Struct with long sequence of optional fields alternating optional and non-optional values
struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Int;
    j: Int?;
}

contract OptionalSeqContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            a:1, b:null, c:true, d:null, e:myAddress(), f:null, g:"x", h:null, i:2, j:null
        };
    }
}