// complicated nested optionals and field serialization
struct NestedSerializedOpt {
    a: Int as uint8;
    b: Bool;
    c: String?;
    d: Address?;
}

contract SerializeOptNested {
    val: NestedSerializedOpt?;

    init() {
        self.val = null;
    }
}
