struct NestedA { v: Int; }
struct NestedB { a: NestedA; }

contract OptionalNestedStruct {
    val: NestedB?;

    init() {
        self.val = null;
    }
}
