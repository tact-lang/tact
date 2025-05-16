// Mixing default and non-default fields
struct MixedDefaults {
    a: Int;                // no default
    b: Int = 2;           // default
    c: Bool;              // no default
    d: String = "hi";    // default
    e: Bool = false;      // default
}

contract StructPartialDefaults {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{ a: 1, c: true };
    }
}