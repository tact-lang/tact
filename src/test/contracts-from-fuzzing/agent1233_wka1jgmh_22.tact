// Test optional struct as field
struct Possible {
    x: Int;
}

contract OptionalStructField {
    maybe: Possible?;

    init() {
        self.maybe = null;
    }
}