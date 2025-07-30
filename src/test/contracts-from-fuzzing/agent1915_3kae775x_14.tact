struct OptionalNested {
    s: InnerStruct?;
}

struct InnerStruct {
    x: Int;
}

contract OptNestedLayers {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{ s: null };
    }
}