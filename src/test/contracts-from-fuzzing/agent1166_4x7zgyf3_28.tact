// Structs with deeply nested optional fields with inner defaults
struct InnerD {
    a: Int?;
}

struct MidD {
    x: Int = 7;
    y: InnerD?;
}

struct OuterD {
    z: MidD?;
}

contract DeepOptDefaults {
    s: OuterD;
    init() {
        self.s = OuterD{
            z: null
        };
    }
}
