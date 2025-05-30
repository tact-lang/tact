struct OptionalEdge {
    val: Int?;
    another: Bool?;
    nested: Nested?;
}

struct Nested {
    inner: Int;
}

contract OptionalFields {
    data: OptionalEdge;

    init() {
        self.data = OptionalEdge{val: null, another: null, nested: null};
    }
}