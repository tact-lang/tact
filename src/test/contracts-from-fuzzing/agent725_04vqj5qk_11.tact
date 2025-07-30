struct NestedOption {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract CompoundOptional {
    val: NestedOption?;

    init() {
        self.val = null;
    }
}