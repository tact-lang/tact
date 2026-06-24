// Struct with many optional fields and some defaults
struct MixedDefaults {
    a: Int?;
    b: String? = null;
    c: Bool? = null;
    d: Address?;
}

contract OptDefaults {
    s: MixedDefaults;
    init() {
        self.s = MixedDefaults{
            a:null,
            b:null,
            c:null,
            d:null
        };
    }
}