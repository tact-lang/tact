struct NestedOptionalDeep {
    s1: String?;
    b1: Bool?;
}

struct NestedOptionalMid {
    inner: NestedOptionalDeep?;
    x: Int;
}

contract NestedOptionalContract {
    data: NestedOptionalMid?;

    init() {
        self.data = null;
    }
}