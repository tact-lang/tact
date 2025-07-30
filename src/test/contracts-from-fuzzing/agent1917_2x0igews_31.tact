// Deeply nested options with mixed non-option structure
struct AA { x: Int?; }
struct BB { a: AA; y: Bool; }
struct CC { b: BB?; s: String; }

contract CrazyOptNest {
    field: CC;

    init() {
        self.field = CC{
            b: null,
            s: "k"
        };
    }
}