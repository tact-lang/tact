// Contract with deeply nested struct which uses both defaultable and optional fields
struct InnerMost {
    a: Int = 1;
    b: Bool? = null;
}

struct Mid {
    x: InnerMost;
    y: Int?;
}

struct Top {
    first: Mid;
    second: Mid?;
}

contract DeepDefaults {
    val: Top;
    init() {
        self.val = Top{
            first: Mid{ x: InnerMost{ a:5,b:true }, y:10 },
            second: null
        };
    }
}