// Optional struct with nested optional primitives
struct OptNested {
    a: Int?;
    b: Bool?;
}

contract OptionalStructField {
    val: OptNested?;

    init() {
        self.val = null;
    }
}
