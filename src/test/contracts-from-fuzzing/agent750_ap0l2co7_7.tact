struct Data {
    a: Int;
    b: Bool;
}

struct Wrap {
    inner: Data;
}

contract NestedOptionalWrap {
    val: Wrap?;
    init() {
        self.val = null;
    }
}