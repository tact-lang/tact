// Struct with optional nested struct using default null value
struct First {
    x: Int;
}

struct Second {
    f: First?; // default null implicit
    y: Int;
}

contract OptionalStructField {
    val: Second;

    init() {
        self.val = Second{
            f: null,
            y: 42
        };
    }
}