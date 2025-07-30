struct InnerType {
    a: Int;
    b: Bool?;
    c: String?;
}

contract NestedOptionalInner {
    val: InnerType?;

    init() {
        self.val = null;
    }
}