// Nested mixed with optionals and inline defaults
struct LP3 {
    a: Int = 3;
    b: Bool?;
}

struct LP2 {
    p3: LP3?;
    s: String;
}

contract OptionDefaults {
    root: LP2;

    init() {
        self.root = LP2{
            p3: null,
            s: "hi",
        };
    }
}