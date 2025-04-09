struct OptionalNest {
    sub: Inner?;
}

struct Inner {
    val: Int;
}

contract OptionalNestedField {
    nest: OptionalNest;

    init() {
        self.nest = OptionalNest{ sub: null };
    }
}