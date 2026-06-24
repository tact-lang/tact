struct StructA { a: Int; b: Bool }
struct StructB { x: Int; y: StructA; z: String }

contract OptionalStructField {
    s: StructB?;

    init() {
        self.s = null;
    }
}