// Nested structs with optional strings and ints
struct S1 {
    s: String?;
    i: Int?;
}

struct S2 {
    s1a: S1?;
    s1b: S1?;
}

contract DeepOptCombo {
    s2: S2;

    init() {
        self.s2 = S2{
            s1a: S1{ s:null, i:5 },
            s1b: null
        };
    }
}
