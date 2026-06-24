struct NestedStruct { a: Int; b: Bool; c: String; }

contract StructInField {
    val: NestedStruct;
    init() {
        self.val = NestedStruct{ a: 1, b: true, c: "ok" };
    }
}