struct OptionalNested {
    x: Int?;
    y: InnerOption?;
}

struct InnerOption {
    z: Bool;
}

contract Test {
    field: OptionalNested;
    init() {
        self.field = OptionalNested{x: null, y: null};
    }
}