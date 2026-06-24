// Test optional of struct with defaults inside optional
struct Inside {
    a: Int = 5;
    b: Bool = false;
}

struct Outer {
    x: Inside?;
}

contract OptionalStructWithDefaults {
    data: Outer;

    init() {
        self.data = Outer{ x: null };
    }
}