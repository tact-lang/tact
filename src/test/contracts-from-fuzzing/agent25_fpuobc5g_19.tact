// Struct that contains another struct with optional fields
struct Inner {
    a: Int?;
    b: Bool?;
}

struct Outer {
    x: Inner;
    y: Int;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            x: Inner{ a: null, b: true },
            y: 5
        };
    }
}