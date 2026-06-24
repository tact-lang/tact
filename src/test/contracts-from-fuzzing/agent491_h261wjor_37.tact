// Struct with optional persistence default init
struct S {
    x: Int?;
    y: String?;
}

contract OptionalStructDefaults {
    data: S;
    init() {
        self.data = S{
            x: null,
            y: null
        };
    }
}