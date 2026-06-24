// Test using optional Struct itself as optional persistent variable

struct Embedded {
    x: Int;
    y: Int;
}

contract OptionalStructField {
    data: Embedded?;

    init() {
        self.data = Embedded{
            x: 7,
            y: 8,
        };
    }
}